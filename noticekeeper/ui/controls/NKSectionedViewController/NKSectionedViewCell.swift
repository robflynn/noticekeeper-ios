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

    sectionCellDidLoad()
  }

  func sectionCellDidLoad() {}
}
