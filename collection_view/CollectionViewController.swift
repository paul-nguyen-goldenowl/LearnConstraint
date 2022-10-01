//
//  CollectionViewController.swift
//  LearnConstraint
//
//  Created by Golden Owl on 30/09/2022.
//

import UIKit

class CollectionViewController: UIViewController {
    
    private let collectionPadding: CGFloat = 16
    private let columnPadding: CGFloat = 12
    private let rowPadding: CGFloat = 16
    
    lazy var layout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = rowPadding
        layout.minimumInteritemSpacing = rowPadding
        let size = view.frame.width / 2 - rowPadding - collectionPadding * 2
        layout.itemSize = CGSize(width: size, height: size)
        return layout
    }()
         
    
    lazy var collectionView : UICollectionView = {
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        
        view.register(CustomUICollectionViewCell.self, forCellWithReuseIdentifier: CustomUICollectionViewCell.identifier)
        
        view.dataSource = self
        view.delegate = self
        
        view.setCollectionViewLayout(layout, animated: true)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        setLayout()
    }
    
    private func setLayout(){
        view.addSubview(collectionView)
        
        collectionView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: collectionPadding).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -collectionPadding).isActive = true
        collectionView.backgroundColor = .gray
    }
    
}

extension CollectionViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CustomUICollectionViewCell.identifier, for: indexPath) as! CustomUICollectionViewCell

        cell.bind(with: (indexPath.row))
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 30
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("selected item \(indexPath.row)")
    }
}
