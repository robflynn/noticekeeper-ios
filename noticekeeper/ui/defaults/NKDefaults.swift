//
//  NKDefaults.swift
//  noticekeeper
//
//  Created by Rob Flynn on 10/28/18.
//  Copyright © 2018 Thingerly. All rights reserved.
//

import Foundation
import UIKit

/// Defaults
struct NKDefaults {

  struct Color {
    static var blue = UIColor(hexString: "#4F9AC2")

    // named
    static var tableHeaderBackground = Color.blue
  }

  struct Table {
    static func headerView() -> UIView {
      return NKTableSectionHeaderView()
    }
  }
}
