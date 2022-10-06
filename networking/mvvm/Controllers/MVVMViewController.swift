//
//  MVVMViewController.swift
//  LearnConstraint
//
//  Created by Golden Owl on 06/10/2022.
//

import UIKit

class MVVMViewController: UIViewController {
    lazy var employeeTableView: UITableView = {
        let tableView = UITableView()
        tableView.backgroundColor = .white
        tableView.register(EmployeeTableViewCell.self, forCellReuseIdentifier: "EmployeeTableViewCell")
        tableView.estimatedRowHeight = 50
        tableView.rowHeight = UITableView.automaticDimension
        return tableView
    }()
        
    private var employeeViewModel: EmployeesViewModel!
        
    private var dataSource: EmployeeTableViewDataSource<EmployeeTableViewCell, EmployeeData>!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubview(self.employeeTableView)
        
        self.callToViewModelForUIUpdate()
        self.employeeTableView.frame = view.bounds
    }
        
    func callToViewModelForUIUpdate() {
        self.employeeViewModel = EmployeesViewModel()
        self.employeeViewModel.bindEmployeeViewModelToController = {
            self.updateDataSource()
        }
    }
        
    func updateDataSource() {
        guard let data: [EmployeeData] = self.employeeViewModel.empData?.data else {
            print("data nil")
            return
        }
        print("updateDataSource")
        print(data.count)
        self.dataSource = EmployeeTableViewDataSource(cellIdentifier: "EmployeeTableViewCell", items: data, configureCell: { cell, employee in
            cell.employeeIdLabel.text = "\(employee.id)"
            cell.employeeNameLabel.text = "\(employee.employeeName)"
        })
            
        DispatchQueue.main.async {
            self.employeeTableView.dataSource = self.dataSource
            self.employeeTableView.reloadData()
        }
    }
}
