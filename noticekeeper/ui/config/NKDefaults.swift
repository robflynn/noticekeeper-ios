//
//  NKDefaults.swift
//  noticekeeper
//
//  Created by Rob Flynn on 10/28/18.
//  Copyright © 2018 Thingerly. All rights reserved.
//

import Foundation
import UIKit

struct NKDefaults {
  struct UI {
    struct Table {
      static func headerView() -> UIView {
        return NKTableSectionHeaderView()
      }
    }
  }
}
