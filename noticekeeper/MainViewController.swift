//
//  MainViewController.swift
//  noticekeeper
//
//  Created by Rob Flynn on 10/27/18.
//  Copyright © 2018 Thingerly. All rights reserved.
//

import UIKit

class MainViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        loadTabs()
    }

    private func loadTabs() {
        let clientsViewController = UIViewController()

        self.viewControllers?.append(clientsViewController)
    }
}
