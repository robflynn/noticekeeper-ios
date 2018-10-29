//
//  NKTableSectionHeaderView.swift
//  noticekeeper
//
//  Created by Rob Flynn on 10/28/18.
//  Copyright © 2018 Thingerly. All rights reserved.
//

import Foundation
import UIKit

class NKTableSectionHeaderView: UIView {

  var text: String? {
    didSet {
      async {
        self.label.text = self.text
      }
    }
  }

  lazy var label = UILabel()

  override init(frame: CGRect) {
    super.init(frame: frame)

    layoutComponents()
  }

  convenience init() {
    self.init(frame: CGRect.zero)
  }

  required init(coder aDecoder: NSCoder) {
    fatalError("This class does not support NSCoding")
  }

  func layoutComponents() {
    addSubview(label)

    label.edges(insetWithin: self, by: 10)
    label.height(min: 30)
    label.text = self.text
    label.textColor = .black

    backgroundColor = UIColor.Theme.tableHeaderBackground
  }
}
