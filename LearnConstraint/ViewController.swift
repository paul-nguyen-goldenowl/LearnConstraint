//
//  ViewController.swift
//  LearnConstraint
//
//  Created by Golden Owl on 29/09/2022.
//

import UIKit

struct Action {
    let name: String
    let destination: UIViewController.Type
}
class ViewController: UIViewController {
    
    private var data = [Action]()
    
    lazy var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "UITableViewCell")
        return tableView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        data.append(Action(name: "Constraint", destination: ConstraintViewController.self))
        data.append(Action(name: "StackView", destination: MyStackViewController.self))
        data.append(Action(name: "TableView", destination: MyTableViewController.self))
        data.append(Action(name: "CollectionView", destination: CollectionViewController.self))
        data.append(Action(name: "Table with collection", destination: TableAndCollectionViewController.self))
        data.append(Action(name: "Tab bar", destination: TabBarController.self))
        data.append(Action(name: "Weak var", destination: WeakVarViewController.self))
        data.append(Action(name: "Weak self", destination: WeakSelfViewController.self))
        data.append(Action(name: "DispatchWorkItem", destination: WorkItemViewController.self))
        data.append(Action(name: "DispatchGroup", destination: DispatchGroupViewController.self))
        data.append(Action(name: "Update main thread", destination: DispatchMainViewController.self))
        
        view.addSubview(tableView)
        setConstraints()
    }
    
    private func setConstraints(){
        var constraints = [NSLayoutConstraint]()
        constraints.append(tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor))
        constraints.append(tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor))
        constraints.append(tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16))
        constraints.append(tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16))
        NSLayoutConstraint.activate(constraints)
    }
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "UITableViewCell", for: indexPath)
        cell.textLabel?.text = data[indexPath.row].name
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let vc = data[indexPath.row].destination.init()
        let nav = UINavigationController(rootViewController: vc)
        present(nav, animated: true)
    }
}
