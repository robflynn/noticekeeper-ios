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

  // Mark: - Helper Methods
  private func fetchCourtCase() {
    print("Fetching case")
  }
}
