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
        buildTabs()
    }

    private func buildTabs() {
        let casesViewController = CasesViewController()

        self.viewControllers = [
            casesViewController
        ]
    }
}
