//
//  TableViewCell.swift
//  LearnConstraint
//
//  Created by Golden Owl on 29/09/2022.
//

import UIKit

class TableViewCell: UITableViewCell {
    
    private let myView : MyView = {
        let v = MyView()
        return v
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        setup()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setup() {
        backgroundColor = .darkGray
        addSubview(myView)
        
        myView.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
        myView.heightAnchor.constraint(equalTo: heightAnchor).isActive = true
        
    }
    
    func bindView(with data: Data){
        myView.setView(from: data)
    }
}
