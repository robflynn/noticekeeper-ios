//
//  MainViewController.swift
//  noticekeeper
//
//  Created by Rob Flynn on 10/27/18.
//  Copyright © 2018 Thingerly. All rights reserved.
//

import UIKit

class MainViewController: UITabBarController {

    private(set) lazy var clientsViewController: ClientsViewController = ClientsViewController()

    override func viewDidLoad() {
        super.viewDidLoad()

        delegate = self

        loadTabs()
    }

    private func loadTabs() {
        self.viewControllers = [
            clientsViewController
        ]
    }
}

extension MainViewController: UITabBarControllerDelegate {
    override func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        print("An item was selected")
    }
}
