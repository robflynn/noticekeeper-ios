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
  typealias RowView = UITableViewCell

  /// The view's sections
  private var sections: [Section] = []

  lazy var tableController = UITableViewController.init(style: .grouped)

  override func viewDidLoad() {
    super.viewDidLoad()

    let tableView = tableController.tableView!
    tableView.dataSource = self
    tableView.delegate = self
    tableView.bounces = false
    
    view.addSubview(tableView)
    tableView.edgesToSuperview()
  }

  /**
   Add a new section to the view

   - parameter yield: Clojure returning the new `Section`
   */
  func section(yield: ((Section) -> ())) {
    let section = Section()
    sections.append(section)

    yield(section)
  }
}

// MARK: - Section
extension NKSectionedViewController {
  class Section {
    var name: String?
    var cells: [NKSectionedViewCell] = []

    func addCell(withName name: String, block: ((NKSectionedViewCell) -> ())?) -> NKSectionedViewCell {
      let cell = NKSectionedViewCell(named: name)

      cells.append(cell)

      block?(cell)

      return cell
    }
  }
}

// MARK: - UITableViewDataSource
extension NKSectionedViewController: UITableViewDataSource {
  func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
    return sections[section].name
  }

  func numberOfSections(in tableView: UITableView) -> Int {
    return sections.count
  }

  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    let viewSection = sections[section]

    return viewSection.cells.count
  }

  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let viewSection = sections[indexPath.section]
    let row = viewSection.cells[indexPath.row]

    let cell = UITableViewCell()
    cell.addSubview(row)
    row.edges(insetWithin: cell, by: 10)

    return cell
  }
}

// MARK: - UITableViewDelegate
extension NKSectionedViewController: UITableViewDelegate {
  func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
    let title = self.tableView(tableView, titleForHeaderInSection: section)

    let view = NKTableSectionHeaderView()
    view.text = title
    
    return view
  }

  func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
    return 50
  }
}
