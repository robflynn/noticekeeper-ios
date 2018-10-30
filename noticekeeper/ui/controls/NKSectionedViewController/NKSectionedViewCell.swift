//
//  NKTableSectionCell
//  noticekeeper
//
//  Created by Rob Flynn on 10/29/18.
//  Copyright © 2018 Thingerly. All rights reserved.
//
import UIKit

class NKSectionedViewCell: UIView {
  var name: String?

  convenience init(named name: String) {
    self.init()

    self.name = name
  }
}
