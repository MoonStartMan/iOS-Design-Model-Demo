//
//  AppDelegate.swift
//  Design-Model-Demo
//
//  Created by 王潇 on 2023/11/2.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.backgroundColor = .white
        let navViewController = UINavigationController(rootViewController: ViewController())
        window?.rootViewController = navViewController
        window?.makeKeyAndVisible()
        return true
    }


}

