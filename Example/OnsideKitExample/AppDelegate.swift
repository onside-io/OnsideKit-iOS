//
//  AppDelegate.swift
//  OnsideKitExample
//
//  Created by Alexander Goremykin on 13.07.2025.
//

import UIKit
import SwiftUI
import OnsideKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        Onside.callbackScheme = "sdk-example-scheme"

        let window = UIWindow()
        window.rootViewController = UIHostingController(rootView: RootScreen())
        self.window = window
        window.makeKeyAndVisible()

        return true
    }

    func application(
        _ app: UIApplication,
        open url: URL,
        options: [UIApplication.OpenURLOptionsKey : Any] = [:]
    ) -> Bool {
        Onside.handle(url: url)
    }

}
