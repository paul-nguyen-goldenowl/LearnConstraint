//
//  CustomCollectionViewCell.swift
//  LearnConstraint
//
//  Created by Golden Owl on 30/09/2022.
//

import UIKit

class CustomUICollectionViewCell: UICollectionViewCell {
    
    static let identifier = "CustomCollectionViewCell"
    
    lazy var checkImage: UIImageView = {
        let image = UIImageView()
        image.translatesAutoresizingMaskIntoConstraints = false
//        image.image = UIImage(systemName: "checkmark.square")
        image.contentMode = .scaleAspectFit
        image.clipsToBounds = true
        return image
    }()
    
    lazy var extraLabel : UILabel = {
        let lb = UILabel()
        lb.translatesAutoresizingMaskIntoConstraints = false
        lb.textAlignment = .center
        lb.clipsToBounds = true
//        lb.text = "check"
        return lb
    }()
    
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
        contentView.addSubview(checkImage)
        contentView.addSubview(extraLabel)
        
        var constraints = [NSLayoutConstraint]()
        constraints.append(myImageView.widthAnchor.constraint(equalTo: widthAnchor, multiplier: 0.5))
        constraints.append(myImageView.heightAnchor.constraint(equalTo: heightAnchor, multiplier: 0.5))
        constraints.append(myImageView.topAnchor.constraint(equalTo: extraLabel.bottomAnchor, constant: 8))
        constraints.append(myImageView.centerXAnchor.constraint(equalTo: centerXAnchor))
        
        constraints.append(myLabel.topAnchor.constraint(equalTo: myImageView.bottomAnchor, constant: 4))
        constraints.append(myLabel.centerXAnchor.constraint(equalTo: centerXAnchor))
        
        constraints.append(checkImage.topAnchor.constraint(equalTo: topAnchor, constant: 4))
        constraints.append(checkImage.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -4))
        
        constraints.append(extraLabel.topAnchor.constraint(equalTo: checkImage.bottomAnchor, constant: 4))
        constraints.append(extraLabel.trailingAnchor.constraint(equalTo: checkImage.trailingAnchor))
        NSLayoutConstraint.activate(constraints)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func bind(with index: Int){
        myLabel.text = "house \(index)"
        if index % 3 == 0 {
            checkImage.image = UIImage(systemName: "square")
            extraLabel.text = "unchecked"
        }else{
            checkImage.image = UIImage(systemName: "checkmark.square")
            extraLabel.text = "checked"
        }
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        myLabel.text = nil
    }
}
