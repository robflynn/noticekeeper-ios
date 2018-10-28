//
//  CaseDetailViewController.swift
//  noticekeeper
//
//  Created by Rob Flynn on 10/27/18.
//  Copyright © 2018 Thingerly. All rights reserved.
//

import UIKit
import TinyConstraints

class NKLabeledCell: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)

        print("Cool")

        layoutControl()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)

        print("Cool Cool Cool")
        layoutControl()
    }

    private func layoutControl() {
        let label = UILabel()
        label.text = "Hello, Control"
        label.backgroundColor = .red

        addSubview(label)

        label.edges(to: self, insets: self.safeAreaInsets + 10)

        self.height(min: 70)
    }
}

class CourtCaseDetailsView: UIView {
    var courtCase: CourtCase?

    convenience required init(for courtCase: CourtCase?) {
        self.init()

        self.courtCase = courtCase

        let cell = NKLabeledCell()

        addSubview(cell)

        cell.left(to: self)
        cell.right(to: self)
        cell.top(to: self)
        cell.backgroundColor = .purple

        self.backgroundColor = .brown
    }
}

class CaseDetailViewController: UIViewController {
    var courtCase: CourtCase?
    var courtCaseDetailsView: CourtCaseDetailsView!

    override func viewDidLoad() {
        super.viewDidLoad()

        self.courtCaseDetailsView = CourtCaseDetailsView(for: courtCase)

        self.view.addSubview(courtCaseDetailsView)
        courtCaseDetailsView.edgesToSuperview()
    }
}
