//
//  WeakVarViewController.swift
//  LearnConstraint
//
//  Created by Golden Owl on 03/10/2022.
//

import UIKit

class LView: UIView {
    weak var vc: UIViewController?
    init(vc: UIViewController){
        self.vc = vc
        super.init(frame: .zero)
    }
    
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

class WeakVarViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .gray
        
        let button = UIButton(frame: CGRect(x: 50, y: 50, width: 200, height: 30))
        button.setTitle("Tap me", for: .normal)
        button.backgroundColor = .link
        button.addTarget(self, action: #selector(didTapButton), for: .touchUpInside)
        
        view.addSubview(button)
    }
    
    @objc func didTapButton(){
        let vc = LViewController()
        vc.title = "Second View"
        vc.view.backgroundColor = .blue
        let nav = UINavigationController(rootViewController: vc)
        present(nav, animated: true)
    }
}

class LViewController : UIViewController {
    var lView : LView?
    override func viewDidLoad() {
        super.viewDidLoad()
        lView = LView(vc: self)
    }
}
