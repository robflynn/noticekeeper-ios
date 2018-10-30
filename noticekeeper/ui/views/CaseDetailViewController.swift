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
      print(courtCase)
    }
  }

  override func viewDidLoad() {
    super.viewDidLoad()

    guard let courtCase = courtCase else { return }

    section {
      $0.name = courtCase.caseName

      $0.addCell(withName: "caseNumber") { cell in
        let label = UILabel()
        label.text = "Case Number: \(courtCase.caseNumber) [I am a custom Cell Now]"

        cell.addSubview(label)
        label.edgesToSuperview()
      }
    }

    section { section in
      section.name = "Documents"
    }
  }
}
