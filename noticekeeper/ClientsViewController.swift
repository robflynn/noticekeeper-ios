//
//  ClientsViewController.swift
//  noticekeeper
//
//  Created by Rob Flynn on 10/27/18.
//  Copyright © 2018 Thingerly. All rights reserved.
//

import UIKit
import TinyConstraints

class ClientsViewController: UIViewController {
    private lazy var tableView = UITableView()

    override func viewDidLoad() {
        super.viewDidLoad()

        buildView()
        loadData()
    }

    private func buildView() {
        self.view.addSubview(tableView)

        tableView.backgroundColor = .orange

        tableView.edges(to: self.view.safeAreaLayoutGuide)

        self.tabBarItem = UITabBarItem(title: "Clients", image: nil, selectedImage: nil)
    }

    private func loadData() {
        noticekeeper.clients {
            print("inside the clients callback")
        }
    }
}
