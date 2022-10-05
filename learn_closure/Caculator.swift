//
//  Caculator.swift
//  LearnConstraint
//
//  Created by Golden Owl on 04/10/2022.
//

import Foundation

protocol AddOperatorDelegate: AnyObject {
    func calculate(first: Int, second: Int, result: Int)
}

protocol AddOperatorDatasource: AnyObject {
    func getFirstNumber() -> Int
    func getSecondNumber() -> Int
}

class MyCalculator {
    weak var delegate: AddOperatorDelegate?
    weak var dataSource: AddOperatorDatasource?

    init() {}

    func add() {
        guard let dataSource = dataSource else {
            print("error")
            return
        }

        let first = dataSource.getFirstNumber()
        let second = dataSource.getSecondNumber()

        let result = first + second

        if let delegate = delegate {
            delegate.calculate(first: first, second: second, result: result)
        }
    }
}
