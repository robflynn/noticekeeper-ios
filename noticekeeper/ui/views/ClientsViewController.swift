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
    private var splitVC: NKSplitViewController!

    private var masterController = UITableViewController()
    private var detailController = UIViewController()

    /// Clients
    private(set) var clients: [Client] = []

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }

    override func viewDidLoad() {
        buildSubViews()

        splitVC = NKSplitViewController(master: masterController, detail: detailController)

        self.view.addSubview(splitVC.view)

        splitVC.view.edges(to: self.view.safeAreaLayoutGuide)

        self.tabBarItem.title = "Clients"

        loadData()
    }

    private func buildSubViews() {
        buildMasterView()
    }

    private func buildMasterView() {
        self.masterController.tableView.delegate = self
        self.masterController.tableView.dataSource = self
    }

    private func loadData() {
        noticekeeper.clients { clients in
            self.clients = clients

            DispatchQueue.main.async {
                self.masterController.tableView.reloadData()
            }
        }
    }
}

// MARK: - UITableViewDataSource
extension ClientsViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.clients.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "ClientCell")

        let client = self.clients[indexPath.row]
        cell.textLabel?.text = client.caseName

        cell.detailTextLabel?.text = client.caseNumber
        cell.detailTextLabel?.textColor = .red

        return cell
    }
}

// MARK: - UITableViewDelegate
extension ClientsViewController: UITableViewDelegate {

}
