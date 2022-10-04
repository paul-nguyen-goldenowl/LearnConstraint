//
//  WorkItemViewController.swift
//  LearnConstraint
//
//  Created by Golden Owl on 03/10/2022.
//

import UIKit

class WorkItemViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        var value = 10
        let workItem = DispatchWorkItem {
            value += 5
        }
        workItem.perform()
        let queue = DispatchQueue.global()
        queue.async(execute: workItem)
        workItem.notify(queue: DispatchQueue.main) {
            print(value)
        }
    }
}
