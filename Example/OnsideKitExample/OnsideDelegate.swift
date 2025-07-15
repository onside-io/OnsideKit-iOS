//
//  OnsideDelegate.swift
//  OnsideKitExample
//
//  Created by Alexander Goremykin on 14.07.2025.
//

import UIKit
import OnsideKit

@MainActor
final class SDKDelegate: OnsideDelegate {

    // MARK: - Public Properties

    var shouldForceLocalLoginMethods = false
    var countryCodeHint: String?

    // MARK: - Constructors

    init() {
        Onside.delegate = self
    }

    // MARK: - Public Methods

    func onside(hostWindowSceneForScreen screen: OnsideScreen) -> UIWindowScene? {
        nil
    }

    func onside(uiThemeOverrideForScreen screen: OnsideScreen) -> OnsideUIThemeMode? {
        nil
    }

    func onsideShouldForceLocalLoginMethods() -> Bool {
        shouldForceLocalLoginMethods
    }

    func onsideDefaultCountryCodeAssumption() -> String? {
        countryCodeHint
    }

}
