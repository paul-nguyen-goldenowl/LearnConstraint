//
//  TableAndCollectionViewController.swift
//  LearnConstraint
//
//  Created by Golden Owl on 30/09/2022.
//

import UIKit

class TableAndCollectionViewController: UIViewController {
    
    private let tablePadding: CGFloat = 16
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "UITableViewCell")
        tableView.register(CustomUITableViewCell.self, forCellReuseIdentifier: CustomUITableViewCell.identifier)
        tableView.dataSource = self
        tableView.delegate = self
        tableView.rowHeight = 44
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
 
        view.addSubview(tableView)
        setLayout()
    }
    
    private func setLayout(){
        var constraints = [NSLayoutConstraint]()
        constraints.append(tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 16))
        constraints.append(tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor))
        constraints.append(tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: tablePadding))
        constraints.append(tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -tablePadding))
        NSLayoutConstraint.activate(constraints)
    }
    
}

extension TableAndCollectionViewController: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if(indexPath.row % 5 == 0){
            let cell = tableView.dequeueReusableCell(withIdentifier: CustomUITableViewCell.identifier, for: indexPath) as! CustomUITableViewCell
            cell.bind(withRow: indexPath.row)
            return cell
        }else{
            let cell = tableView.dequeueReusableCell(withIdentifier: "UITableViewCell", for: indexPath)
            cell.textLabel?.text = "cell \(indexPath.row)"
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 20
    }
    
}

extension TableAndCollectionViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "UICollectionViewCell", for: indexPath)
        
        cell.contentView.backgroundColor = .red
        
        return cell
    }
}
