//
//  WeakSelfViewController.swift
//  LearnConstraint
//
//  Created by Golden Owl on 03/10/2022.
//

import UIKit

class WeakSelfViewController: UIViewController {
    var alert: UIAlertController?

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white

        // if alert declared here, it not leak
        // let alert = UIAlertController(title: "Alert", message: "Message", preferredStyle: .alert)

        alert = UIAlertController(title: "Alert", message: "Message", preferredStyle: .alert)

        guard let alert = alert else { return }

        alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: { [weak self] _ in
            guard let strongSelf = self else { return }
            strongSelf.doSomething()
        }))

        /* this not leak */
        // alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: { _ in
        //     print("hello")
        // }))

        /* this leak!!! */
        // alert.addAction(UIAlertAction(title: "OK", style: .cancel, handler: { _ in
        //     self.doSomething()
        // }))

        present(alert, animated: true)
    }

    private func doSomething() {
        print("do something")
    }
}
