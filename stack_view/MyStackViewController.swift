//
//  MyStackViewController.swift
//  LearnConstraint
//
//  Created by Golden Owl on 01/10/2022.
//

import UIKit

class MyStackViewController: UIViewController {
    
    lazy var stackView : UIStackView = {
        let view = UIStackView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.axis = .vertical
        view.alignment = .fill
        view.distribution = .fill
        view.spacing = 16
        view.backgroundColor = .white
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemGray2
        view.addSubview(stackView)
        
        stackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        stackView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor).isActive = true
        stackView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor).isActive = true
        
        addViews()
    }
    
    private func addViews(){
        for i in 0...10{
            let button = UIButton()
            button.setTitle("Button \(i)", for: .normal)
            button.setTitleColor(.black, for: .normal)
            button.layer.borderWidth = 1
            button.layer.cornerRadius = 4
            button.layer.borderColor = UIColor.black.cgColor
            
            button.tag = i
            button.addTarget(self, action: #selector(buttonClicked), for: .touchUpInside)
            stackView.addArrangedSubview(button)
        }
    }
    
    @objc func buttonClicked(sender:UIButton)
    {
        print("hello \(sender.tag)")
    }
}
