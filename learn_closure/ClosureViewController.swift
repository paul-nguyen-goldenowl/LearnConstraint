//
//  ClosureViewController.swift
//  LearnConstraint
//
//  Created by Golden Owl on 04/10/2022.
//

import UIKit

class ClosureViewController: UIViewController {
    var first: Int = 3
    var second: Int = 5

    var myCalculator: MyCalculator?
    var myCalculator2: MyCalculator2?

    func handleDelegate() {
        myCalculator = MyCalculator()
        guard let myCalculator = myCalculator else { return }
        myCalculator.delegate = self
        myCalculator.dataSource = self
        myCalculator.add()
    }

    func handleClosure() {
        myCalculator2 = MyCalculator2()
        guard let myCalculator2 = myCalculator2 else { return }

//        myCalculator2.add(first: { [weak self] () -> Int in
//            guard let self = self else { return 0 }
//            return self.first
//        }, second: { [weak self] in
//            guard let self = self else { return 0 }
//            return self.second
//        }) { first, second, result in
//            print("\(first) + \(second) = \(result)")
//        }

        myCalculator2.add(first: { () -> Int in
            self.first
        }, second: { self.second }) { first, second, result in
            print("\(first) + \(second) = \(result)")
        }
    }

    lazy var closureView: ClosureView = {
        let closureView = ClosureView()
        closureView.backgroundColor = .blue
        closureView.tapHandler = {
            print("Tapped")
        }
        return closureView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        handleDelegate()
        handleClosure()
        view.addSubview(closureView)
    }
}

extension ClosureViewController: AddOperatorDelegate, AddOperatorDatasource {
    func getFirstNumber() -> Int {
        return first
    }

    func getSecondNumber() -> Int {
        return second
    }

    func calculate(first: Int, second: Int, result: Int) {
        print("\(first) + \(second) = \(result)")
    }
}
