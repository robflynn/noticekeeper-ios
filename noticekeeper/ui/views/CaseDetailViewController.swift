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

      $0.add("Case Number: \(courtCase.caseNumber)")
      $0.add("State: \(courtCase.locality)")
      $0.add("Status: \(courtCase.status)")
    }

    section {
      $0.name = "Documents"
      $0.add("No documents yet. I haven't written the code.")
    }
  }
}
