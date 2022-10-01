//
//  ConstraintViewController.swift
//  LearnConstraint
//
//  Created by Golden Owl on 29/09/2022.
//

import UIKit

class ConstraintViewController: UIViewController {

    lazy var firstView : UIView = {
        let view = UIView()
        view.backgroundColor = .red
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    } ()
    
    lazy var secondView : UIView = {
        let view = UIView()
        view.backgroundColor = .blue
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    } ()

    lazy var centerView : UIView = {
        let view = UIView()
        view.backgroundColor = .green
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        // Do any additional setup after loading the view.
        setupLayout()
    }
    
    private func setupLayout(){
        view.addSubview(firstView)
        view.addSubview(secondView)
        view.addSubview(centerView)
        
        
        // first view
        
        firstView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        firstView.widthAnchor.constraint(equalToConstant: 100).isActive = true
        firstView.topAnchor.constraint(equalTo: view.topAnchor, constant: 50).isActive = true
        firstView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50).isActive = true
        
        // second view
        secondView.heightAnchor.constraint(equalToConstant: 70).isActive = true
        secondView.widthAnchor.constraint(equalToConstant: 70).isActive = true

        secondView.leadingAnchor.constraint(equalTo: firstView.trailingAnchor, constant: 20).isActive = true
        secondView.bottomAnchor.constraint(equalTo: firstView.bottomAnchor).isActive = true
        
        // centerview
        NSLayoutConstraint(item: centerView, attribute: .centerX, relatedBy: .equal, toItem: view, attribute: .centerX, multiplier: 1, constant: 0).isActive = true
        
        NSLayoutConstraint(item: centerView, attribute: .centerY, relatedBy: .equal, toItem: view, attribute: .centerY, multiplier: 1, constant: 0).isActive = true
        
        NSLayoutConstraint(item: centerView, attribute: .width, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 200).isActive = true
        
        NSLayoutConstraint(item: centerView, attribute: .height, relatedBy: .equal, toItem: nil, attribute: .notAnAttribute, multiplier: 1, constant: 200).isActive = true
        
        
    }
}
