//
//  AppDelegate.swift
//  SparTest
//
//  Created by Vadim Kim on 14.08.2023.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        guard let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene else { return true }
        self.window = UIWindow(windowScene: windowScene)
        self.window?.rootViewController = ViewController()
        self.window?.makeKeyAndVisible()
        return true
    }
}
