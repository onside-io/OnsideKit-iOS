//
//  RootScreen.swift
//  OnsideKitExample
//
//  Created by Alexander Goremykin on 13.07.2025.
//

import SwiftUI
import OnsideKit

struct RootScreen: View {

    @State private var transactionObserver = PaymentTransactionObserver()
    @State private var productsRepository = ProductsRepository()
    @State private var sdkDelegate = SDKDelegate()
    @State private var sdkAppearance = OnsideUIThemeMode.auto

    var body: some View {
        ScrollView {
            VStack(spacing: 24.0) {
                Image(.onsideLogo)
                    .resizable()
                    .frame(width: 100.0, height: 100.0)
                    .padding(.top, 16.0)
                appearanceSection
                storefrontSection
                paymentMethodsSection
                productsSection
                purchasesSection
            }
            .padding(.horizontal, 16.0)
            .padding(.bottom, 16.0)
        }
        .background(Color(.systemBackground))
    }

    var appearanceSection: some View {
        Section(
            systemImage: "paintbrush",
            title: "Appearance",
            content: {
                Picker("", selection: $sdkAppearance) {
                    Text("Auto").tag(OnsideUIThemeMode.auto)
                    Text("Light").tag(OnsideUIThemeMode.light)
                    Text("Dark").tag(OnsideUIThemeMode.dark)
                }
                .pickerStyle(.segmented)
            }
        )
        .onChange(of: sdkAppearance) { _, newValue in
            Onside.appearance().setThemeMode(newValue)
        }
    }

    var storefrontSection: some View {
        Section(
            systemImage: "person",
            title: "Storefront",
            content: {
                if let storefront = transactionObserver.storefront {
                    VStack(spacing: 0.0) {
                        SectionItem(
                            leading: { SectionItemTitle(title: "Country Code") },
                            trailing: { SectionItemTextValue(title: storefront.countryCode) }
                        )
                        SectionItem(
                            leading: { SectionItemTitle(title: "ID") },
                            trailing: { SectionItemTextValue(title: storefront.id).lineLimit(1) }
                        )
                        .padding(.top, 8.0)
                        Button(
                            action: { Onside.logout() },
                            label: {
                                Text("Logout")
                                    .frame(maxWidth: .infinity)
                                    .padding(12.0)
                                    .background(Color(.tertiarySystemBackground))
                                    .clipShape(RoundedRectangle(cornerRadius: 12.0))
                            }
                        )
                        .padding(.top, 20.0)
                    }
                } else {
                    VStack(spacing: 0.0) {
                        SectionItem(
                            leading: { SectionItemTitle(title: "Country Code Hint") },
                            trailing: {
                                TextField("", text: .init(
                                    get: { sdkDelegate.countryCodeHint ?? "" },
                                    set: { sdkDelegate.countryCodeHint = $0 }
                                ))
                                .padding(8.0)
                                .background(Color(.tertiarySystemBackground))
                                .clipShape(RoundedRectangle(cornerRadius: 10.0))
                            }
                        )
                        SectionItem(
                            leading: {
                                SectionItemTitle(title: "Use local login methods")
                                    .fixedSize()
                            },
                            trailing: {
                                Toggle("", isOn: .init(
                                    get: { sdkDelegate.shouldForceLocalLoginMethods },
                                    set: { sdkDelegate.shouldForceLocalLoginMethods = $0 }
                                ))
                            }
                        )
                        .padding(.top, 20.0)
                        Button(
                            action: { Onside.requestLogin() },
                            label: {
                                Text("Login")
                                    .frame(maxWidth: .infinity)
                                    .padding(12.0)
                                    .background(Color(.tertiarySystemBackground))
                                    .clipShape(RoundedRectangle(cornerRadius: 12.0))
                            }
                        )
                        .padding(.top, 8.0)
                    }
                }
            }
        )
    }

    var paymentMethodsSection: some View {
        Section(
            systemImage: "creditcard",
            title: "Payment Methods",
            content: {
                HStack(spacing: 16.0) {
                    Button(
                        action: {
                            Onside.presentPaymentMethodsManager()
                        },
                        label: {
                            Text("Show Available")
                                .frame(maxWidth: .infinity)
                                .padding(12.0)
                                .background(Color(.tertiarySystemBackground))
                                .clipShape(RoundedRectangle(cornerRadius: 12.0))
                        }
                    )
                }
            }
        )
    }

    var productsSection: some View {
        Section(
            systemImage: "shippingbox",
            title: "Products",
            content: {
                VStack(alignment: .leading, spacing: 20.0) {
                    if !productsRepository.products.isEmpty {
                        VStack(alignment: .leading, spacing: 20.0) {
                            ForEach(productsRepository.products, id: \.productIdentifier) { product in
                                Button(action: {
                                    Onside.paymentQueue().add(product)
                                }) {
                                    VStack(alignment: .leading, spacing: 4.0) {
                                        Text(product.localizedTitle)
                                            .font(Font.system(size: 16.0, weight: .medium))
                                            .foregroundStyle(Color(.systemBlue))
                                        Text(product.productIdentifier)
                                            .font(Font.system(size: 10.0, weight: .regular))
                                            .foregroundStyle(Color(.secondaryLabel))
                                    }
                                    .lineLimit(1)
                                }
                            }
                        }
                    }
                    Button(
                        action: { productsRepository.reloadProducts() },
                        label: {
                            HStack(spacing: 16.0) {
                                Text("Reload")
                                    .frame(maxWidth: .infinity)
                                    .padding(12.0)
                                    .background(Color(.tertiarySystemBackground))
                                    .clipShape(RoundedRectangle(cornerRadius: 12.0))
                                if productsRepository.isReloading {
                                    ProgressView().progressViewStyle(.circular)
                                }
                            }
                        }
                    )
                    .disabled(productsRepository.isReloading)
                }
            }
        )
    }

    var purchasesSection: some View {
        Section(
            systemImage: "eurosign",
            title: "Purchases",
            content: {
                VStack(alignment: .leading, spacing: 20.0) {
                    if !transactionObserver.purchasedProducts.isEmpty {
                        VStack(alignment: .leading, spacing: 8.0) {
                            ForEach(transactionObserver.purchasedProducts, id: \.productIdentifier) { product in
                                SectionItem(
                                    leading: { SectionItemTitle(title: product.localizedTitle) },
                                    trailing: { SectionItemTextValue(title: product.productIdentifier).lineLimit(1) }
                                )
                            }
                        }
                    }
                    Button(
                        action: { transactionObserver.restorePurchases() },
                        label: {
                            HStack(spacing: 16.0) {
                                Text("Restore")
                                    .frame(maxWidth: .infinity)
                                    .padding(12.0)
                                    .background(Color(.tertiarySystemBackground))
                                    .clipShape(RoundedRectangle(cornerRadius: 12.0))
                                if transactionObserver.isRestoringPurchases {
                                    ProgressView().progressViewStyle(.circular)
                                }
                            }
                        }
                    )
                    .disabled(transactionObserver.isRestoringPurchases)
                }
            }
        )
    }

}
