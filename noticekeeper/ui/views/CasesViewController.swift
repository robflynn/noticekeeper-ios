//
//  CasesViewController.swift
//  noticekeeper
//
//  Created by Rob Flynn on 10/27/18.
//  Copyright © 2018 Thingerly. All rights reserved.
//

import UIKit
import TinyConstraints

class CasesViewController: UIViewController {
    private var splitVC: NKSplitViewController!

    private var masterController = UITableViewController()
    private var detailController = UIViewController()

    /// Clients
    private(set) var clients: [CourtCase] = [] {
        didSet {
            async {
                self.masterController.tableView.reloadData()
            }
        }
    }

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }

    override func viewDidLoad() {
        buildSubViews()

        splitVC = NKSplitViewController(master: masterController, detail: detailController)

        self.view.addSubview(splitVC.view)

        splitVC.view.edges(to: self.view.safeAreaLayoutGuide)

        self.tabBarItem.title = "Cases"

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
        noticekeeper.cases { cases in
            self.clients = cases
        }
    }
}

// MARK: - UITableViewDataSource
extension CasesViewController: UITableViewDataSource {
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
extension CasesViewController: UITableViewDelegate {

}
