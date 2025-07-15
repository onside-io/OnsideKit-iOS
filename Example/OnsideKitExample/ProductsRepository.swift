//
//  ProductsRepository.swift
//  OnsideKitExample
//
//  Created by Alexander Goremykin on 14.07.2025.
//

import Observation
import OnsideKit

@Observable
@MainActor
final class ProductsRepository: OnsideProductsRequestDelegate {

    // MARK: - Public Properties

    private(set) var products: [OnsideProduct] = []
    private(set) var isReloading = false

    // MARK: - Public Methods

    func reloadProducts() {
        currentRequest = Onside.makeProductsRequest(productIdentifiers: productSKUs)
        currentRequest?.delegate = self
        currentRequest?.start()
        print("Products reloading started")
    }

    func onsideProductsRequest(_ request: OnsideProductsRequest, didReceive response: OnsideProductsResponse) {
        products = response.products
        isReloading = true
    }

    func onsideProductsRequestRequest(_ request: OnsideProductsRequest, didFailWithError error: OnsideProductsRequestError) {
        print("Products reloading failed: \(error)")
        products = []
        isReloading = false
    }

    func onsideProductsRequestDidFinish(_ request: OnsideProductsRequest) {
        print("Products reloading finished")
        isReloading = false
    }

    // MARK: - Private Properties

    private var currentRequest: OnsideProductsRequest?

    private let productSKUs: Set<String> = [
        // Insert your SKUs here
    ]

}
