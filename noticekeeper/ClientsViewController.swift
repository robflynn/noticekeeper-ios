//
//  ClientsViewController.swift
//  noticekeeper
//
//  Created by Rob Flynn on 10/27/18.
//  Copyright © 2018 Thingerly. All rights reserved.
//

import UIKit

class ClientsViewController: UIViewController {
    private lazy var tableView: UITableView = UITableView()

    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.backgroundColor = .orange

        self.view.addSubview(tableView)
    }
}
