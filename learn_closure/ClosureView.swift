//
//  ClosureView.swift
//  LearnConstraint
//
//  Created by Golden Owl on 05/10/2022.
//

import UIKit

class ClosureView: UIButton {
    var tapHandler: (() -> Void)?

    override init(frame: CGRect) {
        super.init(frame: CGRect(x: 0, y: 0, width: 200, height: 200))
        setTitle("ClosureView", for: .normal)
        addTarget(self, action: #selector(didTap), for: .touchUpInside)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    @objc func didTap() {
        tapHandler?()
    }
}
