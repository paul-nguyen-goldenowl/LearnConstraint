//
//  MyView.swift
//  LearnConstraint
//
//  Created by Golden Owl on 29/09/2022.
//

import UIKit

class MyView : UIView {
    
    lazy var lbTitle : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints  = false
        label.text = "Title"
        label.textColor = .white
        label.font = .systemFont(ofSize: 20, weight: .bold)
        return label
    }()
    
    lazy var lbDesc : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints  = false
        label.text = "Description"
        label.textColor = .white
        return label
    }()
    
    lazy var lbState : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints  = false
        label.text = "Description"
        label.textColor = .white
        label.isHidden = true
        return label
    }()
    
    lazy var sView : UIView = {
        let view = UIView()
        view.widthAnchor.constraint(equalToConstant: 1).isActive = true
        view.backgroundColor = .white
        return view
    }()
    
    lazy var lbCode : UILabel = {
        let label = UILabel()
        label.translatesAutoresizingMaskIntoConstraints  = false
        label.text = "200"
        label.textColor = .white
        return label
    }()
    
    lazy var nextBtn : UIButton = {
        let btn = UIButton()
        btn.translatesAutoresizingMaskIntoConstraints  = false
        btn.setImage(UIImage(systemName: "heart.fill"), for: .normal)
        btn.tintColor = .white
        return btn
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    func commonInit() {
        backgroundColor = .lightGray
        translatesAutoresizingMaskIntoConstraints = false
        
        addSubview(lbTitle)
        addSubview(lbDesc)
        addSubview(lbCode)
        addSubview(nextBtn)
        addSubview(lbState)
        
        lbTitle.topAnchor.constraint(equalTo: topAnchor).isActive = true
        lbTitle.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 16).isActive = true
        
        lbCode.centerYAnchor.constraint(equalTo: lbTitle.centerYAnchor).isActive = true
        lbCode.leadingAnchor.constraint(equalTo: lbTitle.trailingAnchor, constant: 8).isActive = true
        
        lbDesc.topAnchor.constraint(equalTo: lbTitle.bottomAnchor, constant: 8).isActive = true
        lbDesc.leadingAnchor.constraint(equalTo: lbTitle.leadingAnchor).isActive = true
        
//        nextBtn.topAnchor.constraint(equalTo: topAnchor, constant: frame.height/2).isActive = true
        nextBtn.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -8).isActive = true
        nextBtn.centerYAnchor.constraint(equalTo: centerYAnchor, constant: -8).isActive = true
        
        lbState.topAnchor.constraint(equalTo: topAnchor).isActive = true
        lbState.trailingAnchor.constraint(equalTo: trailingAnchor).isActive = true
        
    }
    
    func setView(from data: Data){
        lbTitle.text = data.title
        lbDesc.text = data.description
        lbCode.text = String(data.code)
        
        switch(data.type){
        case .connected :
            print("connected = \(data)")
            nextBtn.setImage(UIImage(systemName: "multiply.circle.fill"), for: .normal)
            backgroundColor = .link
            lbState.isHidden = false
            lbState.text = "Connected to"
            break
        case .disconnected :
            nextBtn.setImage(UIImage(systemName: "multiply.circle.fill"), for: .normal)
            backgroundColor = .red
            lbState.isHidden = false
            lbState.text = "Disconected"
            break
        default:
            backgroundColor = .gray
            nextBtn.setImage(UIImage(systemName: "heart.fill"), for: .normal)
        }
    }
}
