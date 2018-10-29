//
//  WoozleViewController.swift
//  noticekeeper
//
//  Created by Rob Flynn on 10/28/18.
//  Copyright © 2018 Thingerly. All rights reserved.
//

import UIKit
import TinyConstraints

/**
 A UITableViewController-based sectioned, programmatic ViewController.
 This is mostly for displaying settings and formy-looking things.
 */
class NKSectionedViewController: UIViewController {

  /// Section
  class Section {
    var name: String?
    var rows: [Row] = []

    func add(_ text: String) -> Row {
      let row = Row(name: text)

      rows.append(row)

      return row
    }
  }

  /// Row
  struct Row {
    var name: String
  }

  typealias RowView = UITableViewCell

  /// The view's sections
  private var sections: [Section] = []

  lazy var tableController: UITableViewController = UITableViewController()

  override func viewDidLoad() {
    super.viewDidLoad()

    let tableView = tableController.tableView!
    tableView.dataSource = self

    view.addSubview(tableView)
    tableView.edgesToSuperview()
  }

  func section(yield: ((Section) -> ())) {
    let section = Section()
    sections.append(section)

    yield(section)
  }
}

extension NKSectionedViewController: UITableViewDataSource {
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
