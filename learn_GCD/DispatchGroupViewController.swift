//
//  DispatchGroupViewController.swift
//  LearnConstraint
//
//  Created by Golden Owl on 03/10/2022.
//

import UIKit

class DispatchGroupViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        DispatchQueue.global(qos: .userInitiated).async {
                    let dispatchGroup = DispatchGroup()
                    dispatchGroup.enter()

                    self.taskOne {
                        print("ONE -> DONE")
                        dispatchGroup.leave()
                    }
                    
                    dispatchGroup.enter()
                    self.taskTwo {
                        print("TWO -> DONE")
                        dispatchGroup.leave()
                    }
                    
                    dispatchGroup.enter()
                    self.taskThree {
                        print("THREE -> DONE")
                        dispatchGroup.leave()
                    }

                    dispatchGroup.wait()
            
                    dispatchGroup.notify(queue: .main) {
                        print("ALL DONE")
                    }
                }
    }
    


    func taskOne(completion: @escaping () -> Void) {
        print("task one")
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            completion()
        }
    }
    
    func taskTwo(completion: @escaping () -> Void) {
        print("task two")
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) {
            completion()
        }
    }

    func taskThree(completion: @escaping () -> Void) {
        print("task three")
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
            completion()
        }
    }

}
