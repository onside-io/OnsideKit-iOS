//
//  PaymentTransactionObserver.swift
//  tExample
//
//  Created by Alexander Goremykin on 13.07.2025.
//

import Observation
import OnsideKit

@Observable
@MainActor
final class PaymentTransactionObserver: OnsidePaymentTransactionObserver {
    
    // MARK: - Public Properties

    private(set) var storefront: OnsideStorefront?
    private(set) var isRestoringPurchases = false
    private(set) var purchasedProducts: [OnsideProduct] = []
    
    // MARK: - Constructors

    init() {
        storefront = Onside.paymentQueue().storefront
        Onside.paymentQueue().add(observer: self)
    }

    // MARK: - Public Methods

    func restorePurchases() {
        isRestoringPurchases = true
        Onside.paymentQueue().restoreCompletedTransactions()
        print("Purchases restoring started")
    }

    func onsidePaymentQueue(_ queue: OnsidePaymentQueue, updatedTransactions: [OnsidePaymentTransaction]) {
        updatedTransactions.forEach { transaction in
            switch transaction.transactionState {
            case .purchasing:
                print("Purchasing of \"\(transaction.product.localizedDescription)\" started")
            case .purchased:
                print("\(transaction.product.localizedDescription) purchased")
                addPurchasedProductIfNeeded(transaction.product)
                queue.finishTransaction(transaction)
            case .restored:
                print("\"\(transaction.product.localizedDescription)\" restored")
                addPurchasedProductIfNeeded(transaction.product)
                queue.finishTransaction(transaction)
            case .failed:
                print("Purchasing of \"\(transaction.product.localizedDescription)\" failed: \(transaction.error?.localizedDescription ?? "n/a")")
                queue.finishTransaction(transaction)
            @unknown default:
                queue.finishTransaction(transaction)
            }
        }
    }

    func onsidePaymentQueue(_ queue: OnsidePaymentQueue, removedTransactions: [OnsidePaymentTransaction]) {
        removedTransactions.forEach {
            print("Transaction of \"\($0.product.localizedDescription)\" removed")
        }
    }

    func onsidePaymentQueueRestoreCompletedTransactionsFinished(_ queue: OnsidePaymentQueue) {
        print("Purchases restoring finished")
        isRestoringPurchases = false
    }

    func onsidePaymentQueue(
        _ queue: OnsidePaymentQueue,
        restoreCompletedTransactionsFailedWithError error: OnsideTransactionsRestoreError
    ) {
        print("Purchases restoring failed: \(error)")
        isRestoringPurchases = false
    }

    func onsidePaymentQueueDidChangeStorefront(_ queue: OnsidePaymentQueue) {
        storefront = queue.storefront
    }

}

fileprivate extension PaymentTransactionObserver {

    // MARK: - Private Methods

    func addPurchasedProductIfNeeded(_ product: OnsideProduct) {
        guard !purchasedProducts.contains(where: { $0.productIdentifier == product.productIdentifier }) else { return }
        purchasedProducts.append(product)
    }

}
