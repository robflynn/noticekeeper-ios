//
//  UIEdgeInsetsHelper.swift
//  noticekeeper
//
//  Created by Rob Flynn on 10/28/18.
//  Copyright © 2018 Thingerly. All rights reserved.
//

import UIKit

extension UIEdgeInsets {
    static func + (left: UIEdgeInsets, right: Int) -> UIEdgeInsets {
        let float = CGFloat(right)

        return UIEdgeInsets(top: left.top + float, left: left.left + float, bottom: left.bottom - float, right: left.right - float)
    }
}

extension UIView {
  func edges(insetWithin view: UIView, by margin: Int) {
    self.edges(to: view, insets: view.safeAreaInsets + margin)
  }
}
