//
//  ViewController.swift
//  LearnConstraint
//
//  Created by Golden Owl on 29/09/2022.
//

import UIKit

class ViewController: UIViewController {
    
    lazy var scrollView : UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.clipsToBounds = true
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()
    
    lazy var btnConstraint : UIButton = {
        let button = UIButton()
        button.setTitle("Constraints", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.borderWidth = 1
        button.layer.cornerRadius = 4
        button.layer.borderColor = UIColor.black.cgColor
        return button
    }()
    
    lazy var btnTable : UIButton = {
        let button = UIButton()
        button.setTitle("Table", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.borderWidth = 1
        button.layer.cornerRadius = 4
        button.layer.borderColor = UIColor.black.cgColor
        return button
    }()
    
    lazy var btnCollection : UIButton = {
        let button = UIButton()
        button.setTitle("Collection", for: .normal)
        button.setTitleColor(.black, for: .normal)
        button.translatesAutoresizingMaskIntoConstraints = false
        button.layer.borderWidth = 1
        button.layer.cornerRadius = 4
        button.layer.borderColor = UIColor.black.cgColor
        return button
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        setupUI()
    }
    
    private func setupUI(){
        view.addSubview(scrollView)
        scrollView.addSubview(btnConstraint)
        scrollView.addSubview(btnTable)
        
        setConstraints()
        btnConstraint.addTarget(self, action: #selector(btnConstraint_clicked), for: .touchUpInside)
        btnTable.addTarget(self, action: #selector(btnTableLayout_clicked), for: .touchUpInside)
    }
    
    private func setConstraints(){
        var constraints = [NSLayoutConstraint]()
        // add constraint
        constraints.append(scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor))
        constraints.append(scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor))
        constraints.append(scrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor))
        constraints.append(scrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor))
      
        constraints.append(btnConstraint.heightAnchor.constraint(equalToConstant: 25))
        constraints.append(btnConstraint.topAnchor.constraint(equalTo: scrollView.topAnchor, constant: 50 ))
        constraints.append(btnConstraint.leadingAnchor.constraint(equalTo: scrollView.leadingAnchor, constant: 16 ))
        constraints.append(btnConstraint.trailingAnchor.constraint(equalTo: scrollView.trailingAnchor, constant: -16))

        constraints.append(btnTable.heightAnchor.constraint(equalToConstant: 25))
        constraints.append(btnTable.trailingAnchor.constraint(equalTo: btnConstraint.trailingAnchor))
        constraints.append(btnTable.leftAnchor.constraint(equalTo: btnConstraint.leftAnchor))
        constraints.append(btnTable.topAnchor.constraint(equalTo: btnConstraint.bottomAnchor, constant: 20))

        NSLayoutConstraint.activate(constraints)
    }
    
    @objc private func btnConstraint_clicked(){
        print("nav to contraint page")
        let vc = ConstraintViewController()
        let nav = UINavigationController(rootViewController: vc)
        present(nav, animated: true)
    }
    
    @objc private func btnTableLayout_clicked(){
        print("nav to table page")
        let vc = MyTableViewController()
        let nav = UINavigationController(rootViewController: vc)
        present(nav, animated: true)
    }
}


extension UIView {
    func constrainRight(){
        
    }
}
