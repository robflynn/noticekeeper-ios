//
//  CaseDetailViewController.swift
//  noticekeeper
//
//  Created by Rob Flynn on 10/27/18.
//  Copyright © 2018 Thingerly. All rights reserved.
//

import UIKit
import TinyConstraints

class CaseDetailViewController: UITableViewController {
    var courtCase: CourtCase?

    convenience init() {
        self.init(style: .plain)

        self.tableView.dataSource = self
    }

    override func viewDidLoad() {
        self.tableView.dataSource = self
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 2
    }

    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return courtCase?.caseName
        case 1:
            return "Documents"
        default:
            return nil
        }
    }

}
