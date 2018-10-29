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
    private(set) var courtCases: [CourtCase] = [] {
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
        self.masterController.tableView.setEmptyMessage("Loading...")
    }

    private func loadData() {
        noticekeeper.cases {
            self.courtCases = $0
        }
    }
}

// MARK: - UITableViewDataSource
extension CasesViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.courtCases.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell(style: .subtitle, reuseIdentifier: "ClientCell")

        let client = self.courtCases[indexPath.row]
        cell.textLabel?.text = client.caseName

        cell.detailTextLabel?.text = client.caseNumber
        cell.detailTextLabel?.textColor = .red

        return cell
    }

    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Cases"
    }
}

// MARK: - UITableViewDelegate
extension CasesViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let courtCase = self.courtCases[indexPath.row]

        let vc = WoozleViewController()

       // vc.courtCase = courtCase

        self.splitVC.showDetailViewController(vc, sender: self)
    }
}
