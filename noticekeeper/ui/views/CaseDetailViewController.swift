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

  private func fetchCourtCase() {
    guard let courtCase = self.courtCase else { return }

    noticekeeper.case(courtCase.id) { courtCase in
      self.renderCourtCase(courtCase)
    }
  }

  override func viewDidLoad() {
    super.viewDidLoad()
  }

  private func renderCourtCase(_ courtCase: CourtCase) {
    let theCase = courtCase

    async {
      logger.debug("beginning async")

      self.section {
        $0.name = "Case"

        $0.addCell(ofType: NKSectionedViewCell.self, withName: "caseNumber") { cell in
          let label = UILabel()
          label.text = theCase.caseNumber

          cell.addSubview(label)
          label.edgesToSuperview()
        }

      }

      self.section {
        $0.name = "Documents"

        let docsCell = $0.addCell(ofType: DocumentsSectionViewCell.self, withName: "docs") { cell in
          let documentsCell = cell as! DocumentsSectionViewCell

          documentsCell.documents = theCase.documents
        }
      }

      defer {
        self.tableController.tableView.reloadData()

        logger.debug("leaving async")
      }
    }
  }
}

class DocumentsSectionViewCell: NKSectionedViewCell {
  var documents: [Document]? = nil

  override func sectionCellDidLoad() {
    super.sectionCellDidLoad()

    self.backgroundColor = .red
  }
}
