//
//  CustomCollectionViewCell.swift
//  LearnConstraint
//
//  Created by Golden Owl on 30/09/2022.
//

import UIKit

class CustomUICollectionViewCell: UICollectionViewCell {
    
    static let identifier = "CustomCollectionViewCell"
    
    lazy var myImageView: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
        image.image = UIImage(systemName: "house")
        image.contentMode = .scaleAspectFit
        image.clipsToBounds = true
        return image
    }()
    
    lazy var myLabel : UILabel = {
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.textAlignment = .center
        lb.clipsToBounds = true
        return lb
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        contentView.backgroundColor = .systemRed
        contentView.addSubview(myImageView)
        contentView.addSubview(myLabel)
        
        var constraints = [NSLayoutConstraint]()
        constraints.append(myImageView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.75))
        constraints.append(myImageView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.75))
        constraints.append(myImageView.centerXAnchor.constraint(equalTo: centerXAnchor))
        
        constraints.append(myLabel.topAnchor.constraint(equalTo: myImageView.bottomAnchor, constant: 4))
        constraints.append(myLabel.centerXAnchor.constraint(equalTo: centerXAnchor))
        NSLayoutConstraint.activate(constraints)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    func bind(with label: String){
        myLabel.text = label
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        myLabel.text = nil
    }
}
