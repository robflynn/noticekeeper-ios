//
//  NKRowCell.swift
//  noticekeeper
//
//  Created by Rob Flynn on 10/29/18.
//  Copyright © 2018 Thingerly. All rights reserved.
//
import UIKit

// TODO: Decide if you still want to go this route...

/// Protocol providing interface for NKSectionedViewController cells
protocol NKRowCell {
  /// Unique (within sectioned view) identifier
  var id: String { get set }

  /// Current value of the cell
  var value: Any? { get set }

  /// View for the UITableViewCell
  ///
  /// - returns: UIView
  func cellView() -> UIView
}
