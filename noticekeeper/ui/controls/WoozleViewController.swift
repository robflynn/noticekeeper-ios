//
//  WoozleViewController.swift
//  noticekeeper
//
//  Created by Rob Flynn on 10/28/18.
//  Copyright © 2018 Thingerly. All rights reserved.
//

import UIKit
import TinyConstraints

class WoozleSectionRow {
  var name: String?
}

class WoozleViewSection {
  var name: String?
  var rows: [WoozleSectionRow] = []

  convenience init(named name: String) {
    self.init()

    self.name = name
  }

  func add(_ text: String) -> WoozleSectionRow {
    let row = WoozleSectionRow()
    row.name = text

    rows.append(row)

    return row
  }
}
class WoozleViewController: UIViewController {

  var sections: [WoozleViewSection] = []
  lazy var tableController: UITableViewController = UITableViewController()

  override func viewDidLoad() {
    super.viewDidLoad()

    let tableView = tableController.tableView!
    tableView.dataSource = self

    view.addSubview(tableView)
    tableView.edges(to: view, insets: view.layoutMargins + 10)

    let caseSection = addSection(named: "Case")
    caseSection.add("Name")
    caseSection.add("Foo")
    caseSection.add("Bar")

    let docSection = addSection(named: "Documents")

    docSection.add("Gravy")
  }

  func addSection(named name: String) -> WoozleViewSection {
    let section = WoozleViewSection(named: name)

    sections.append(section)

    return section
  }
}

extension WoozleViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
    return sections[section].name
  }

  func numberOfSections(in tableView: UITableView) -> Int {
    return sections.count
  }

  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    let viewSection = sections[section]

    return viewSection.rows.count
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let viewSection = sections[indexPath.section]
    let row = viewSection.rows[indexPath.row]

    let cell = UITableViewCell()
    let label = UILabel()
    label.text = row.name
    cell.addSubview(label)
    label.edgesToSuperview()

    return cell
  }
}
