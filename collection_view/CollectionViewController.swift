//
//  CollectionViewController.swift
//  LearnConstraint
//
//  Created by Golden Owl on 30/09/2022.
//

import UIKit

class CollectionViewController: UIViewController {
    
    lazy var layout: UICollectionViewFlowLayout = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumLineSpacing = 1
        layout.minimumInteritemSpacing = 1
        layout.itemSize = CGSize(width: view.frame.width/3 - 2, height: view.frame.width/3 - 2)
        return layout
    }()
    
    lazy var collectionView : UICollectionView = {
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    override func viewDidLoad() {
        super.viewDidLoad()
        setLayout()
    }
    
    
    private func setLayout(){
        view.addSubview(collectionView)
            
        collectionView.dataSource = self
        collectionView.delegate = self

        collectionView.register(CustomUICollectionViewCell.self, forCellWithReuseIdentifier: CustomUICollectionViewCell.identifier)
        collectionView.backgroundColor = .lightGray
        collectionView.frame = view.bounds   
    }
    
}


extension CollectionViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CustomUICollectionViewCell.identifier, for: indexPath) as! CustomUICollectionViewCell

        cell.bind(with: "house \(indexPath.row)")
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 30
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print("selected item \(indexPath.row)")
    }
}
