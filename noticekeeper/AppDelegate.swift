//
//  AppDelegate.swift
//  noticekeeper
//
//  Created by Rob Flynn on 10/27/18.
//  Copyright © 2018 Thingerly. All rights reserved.
//

import UIKit

let noticekeeper = NKClient(.local)

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.

        window = UIWindow(frame: UIScreen.main.bounds)

        let mainViewController = buildMainViewController()

        window?.rootViewController = mainViewController

        window?.makeKeyAndVisible()

        return true
    }

    private func buildMainViewController() -> UIViewController {
        let mainViewController = MainViewController()

        return mainViewController

        /*
        let splitViewController = UISplitViewController()

        let vc1 = UIViewController()
        vc1.view.backgroundColor = .red

        let vc2 = UIViewController()
        vc2.view.backgroundColor = .blue

        splitViewController.viewControllers = [vc1, vc2]

        splitViewController.preferredDisplayMode = .allVisible

        let tvc = UITabBarController()
        tvc.viewControllers = [splitViewController]

        return tvc
        */
    }
}

extension AppDelegate: UISplitViewControllerDelegate {

}
