//
//  CaseDetailViewController.swift
//  noticekeeper
//
//  Created by Rob Flynn on 10/27/18.
//  Copyright © 2018 Thingerly. All rights reserved.
//

import UIKit
import TinyConstraints

class CaseDetailViewController: NKSectionedViewController {
  var courtCase: CourtCase? {
    didSet {
      fetchCourtCase()
    }
  }

  override func viewDidLoad() {
    super.viewDidLoad()

    reloadSections()
  }

  class CollectionViewSectionCell: NKSectionedViewCell {
    lazy var collectionViewLayout = UICollectionViewFlowLayout()

    lazy var collectionView = UICollectionView.init(frame: .zero,
                                                    collectionViewLayout: collectionViewLayout)

    override func sectionCellDidLoad() {
      print("the collection view loaded")

      collectionView.backgroundColor = .purple
      collectionView.height(min: 300)

      addSubview(collectionView)
      collectionView.edgesToSuperview()
    }
  }

  class LabelSectionCell: NKSectionedViewCell {
    lazy var label = UILabel()

    var text: String? {
      didSet {
        async {
          self.label.text = self.text

          print(self.label.text)
          print(self.label)
        }
      }
    }

    override func sectionCellDidLoad() {
      label.text = self.text
      label.textColor = .black
      label.height(min: 30)

      addSubview(label)

      print("in here")

      label.edgesToSuperview()
    }
  }

  // Mark: - Helper Methods
  private func reloadSections() {
    removeAllSections()

    async {
      self.section { section in
        section.name = "Case"

        section.addCell(ofType: LabelSectionCell.self, withName: "CaseNumber") { cell in
          let labelCell = cell as! LabelSectionCell
          labelCell.text = self.courtCase?.caseNumber
        }
      }

      self.section { section in
        section.name = "Documents"

        section.addCell(ofType: CollectionViewSectionCell.self, withName: "Documents") { cell in
          let collectionCell = cell as! CollectionViewSectionCell

          cell.backgroundColor = .yellow
        }
      }

      self.tableController.tableView.reloadData()
    }
  }

  private func fetchCourtCase() {
    guard let courtCase = self.courtCase else { return }

    noticekeeper.case(courtCase.id) { theCase in
      self.reloadSections()
    }
  }

  private func renderCourtCase(_ courtCase: CourtCase) {
    view.backgroundColor = .orange
  }
}
