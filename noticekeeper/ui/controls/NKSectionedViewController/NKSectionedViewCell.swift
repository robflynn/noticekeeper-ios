//
//  NKTableSectionCell
//  noticekeeper
//
//  Created by Rob Flynn on 10/29/18.
//  Copyright © 2018 Thingerly. All rights reserved.
//
import UIKit

class NKSectionedViewCell: UIView {
  required convenience init() {
    self.init(frame: .zero)

    print("in da daddy func")
    sectionCellDidLoad()
  }

  func sectionCellDidLoad() {}

  func minimumHeight() -> Int {
    return 0
  }
}
