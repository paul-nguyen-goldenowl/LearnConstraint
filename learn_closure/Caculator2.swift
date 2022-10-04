//
//  Caculator.swift
//  LearnConstraint
//
//  Created by Golden Owl on 04/10/2022.
//

import Foundation

typealias AddOperatorComplete = (Int, Int, Int) -> Void
typealias FirstNumber = () -> Int
typealias SecondNumber = () -> Int

class MyCalculator2 {
    init() {}

    func add(first: FirstNumber, second: SecondNumber, completion: AddOperatorComplete) {
        let first = first()
        let second = second()
        let result = first + second
        completion(first, second, result)
    }
}
