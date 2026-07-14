import UIKit
import SwiftUI
import OnsideKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    // MARK: - Public Properties

    var window: UIWindow?

    // MARK: - Public Methods

    func scene(
        _ scene: UIScene,
        willConnectTo session: UISceneSession,
        options connectionOptions: UIScene.ConnectionOptions
    ) {
        guard let windowScene = scene as? UIWindowScene else { return }

        let window = UIWindow(windowScene: windowScene)
        window.rootViewController = UIHostingController(rootView: RootScreen())
        self.window = window
        window.makeKeyAndVisible()

        handle(urlContexts: connectionOptions.urlContexts)
    }

    func scene(_ scene: UIScene, openURLContexts urlContexts: Set<UIOpenURLContext>) {
        handle(urlContexts: urlContexts)
    }

}

fileprivate extension SceneDelegate {

    // MARK: - Private Methods

    func handle(urlContexts: Set<UIOpenURLContext>) {
        for urlContext in urlContexts {
            _ = Onside.handle(url: urlContext.url)
        }
    }

}
