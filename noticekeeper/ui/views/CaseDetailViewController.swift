//
//  CaseDetailViewController.swift
//  noticekeeper
//
//  Created by Rob Flynn on 10/27/18.
//  Copyright © 2018 Thingerly. All rights reserved.
//

import UIKit
import TinyConstraints

class Wompy: UIViewController {
    override func viewDidLoad() {
        self.view.backgroundColor = .green

        let field = UILabel()
        field.text = "Testing"

        self.view.addSubview(field)

        field.top(to: self.view)
        field.left(to: self.view)
    }
}

class CaseDetailViewController: UIViewController {
    let wompy = Wompy()

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.addSubview(wompy.view)

        wompy.view.edges(to: self.view, insets: self.view.safeAreaInsets + 10)
    }
}
