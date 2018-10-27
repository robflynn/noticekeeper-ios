//
//  NKSplitViewController.swift
//  noticekeeper
//
//  Created by Rob Flynn on 10/27/18.
//  Copyright © 2018 Thingerly. All rights reserved.
//

import UIKit

/***
 NKSplitViewController

 Custom SplitView controller to present master view first on
 smaller displays
 */
class NKSplitViewController: UISplitViewController {

    /// The master view controller
    private(set) var masterViewController: UIViewController?

    /// The detail view controller
    private(set) var detailViewController: UIViewController?

    /**
     - parameter master: The master view controller
     - parameter detail: The detail view controller
    */
    required convenience init(master: UIViewController, detail: UIViewController) {
        self.init()

        self.masterViewController = master
        self.detailViewController = detail

        self.viewControllers = [self.masterViewController!, self.detailViewController!]

        self.delegate = self
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        self.preferredDisplayMode = .allVisible
    }
}

extension NKSplitViewController: UISplitViewControllerDelegate {
    func splitViewController(_ splitViewController: UISplitViewController, collapseSecondary secondaryViewController: UIViewController, onto primaryViewController: UIViewController) -> Bool {
        return true
    }
}
