//
//  EmployeesViewModel.swift
//  LearnConstraint
//
//  Created by Golden Owl on 06/10/2022.
//

import Foundation

class EmployeesViewModel {
    private var apiService: APIService
    private(set) var empData: Employees? {
        didSet {
            self.bindEmployeeViewModelToController()
        }
    }

    var bindEmployeeViewModelToController: (() -> ()) = {}

    init() {
        self.apiService = APIService()
        self.apiService.getEmployeeList { [weak self] data in
            self?.empData = data
        }
    }
}
