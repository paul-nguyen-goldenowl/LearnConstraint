//
//  MyTableViewController.swift
//  LearnConstraint
//
//  Created by Golden Owl on 29/09/2022.
//

import UIKit

enum DataType{
    case normal, connected, disconnected
}

struct Data{
    let title: String
    let description: String
    let code: Int
    let type: DataType
}



class MyTableViewController: UIViewController {
    
    private let fakeData = [
        Data(title: "data1", description: "description1", code: 200, type: DataType.connected),
        Data(title: "data2", description: "description2", code: 200, type: DataType.normal),
        Data(title: "data3", description: "description3", code: 200, type: DataType.normal),
        Data(title: "data4", description: "description4", code: 200, type: DataType.disconnected),
        Data(title: "data5", description: "description5", code: 200, type: DataType.normal),
        Data(title: "data6", description: "description6", code: 200, type: DataType.normal),
    ]
    
    lazy var tableView: UITableView = {
        let table = UITableView()
        table.translatesAutoresizingMaskIntoConstraints = false
        table.register(TableViewCell.self, forCellReuseIdentifier: "TableViewCell")
        table.delegate = self
        table.dataSource = self
        return table
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        // Do any additional setup after loading the view.
        setLayout()
    }
    
    private func setLayout(){
        view.addSubview(tableView)
        
        tableView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 16).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -16).isActive = true
        tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 16).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -16).isActive = true
            
        tableView.rowHeight = 60
    }
}

extension MyTableViewController: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return fakeData.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell  {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell") as! TableViewCell

        let item = fakeData[indexPath.row]
        cell.bindView(with: item)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("selected \(indexPath.row)")
    }
}
