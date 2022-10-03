//
//  WeakSelfViewController.swift
//  LearnConstraint
//
//  Created by Golden Owl on 03/10/2022.
//

import UIKit

class WeakSelfViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        let alert = UIAlertController(title: "Alert", message: "Message", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: { [weak self] _ in
            guard let strongSelf = self else {return}
            strongSelf.doSomething()
        }))
        present(alert, animated: true)
    }
    
    private func doSomething(){
        print("do something")
    }
}
