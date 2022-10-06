//
//  APIService.swift
//  LearnConstraint
//
//  Created by Golden Owl on 06/10/2022.
//

import Foundation
import UIKit

struct API {
    static let baseURL = "https://raw.githubusercontent.com/paul-nguyen-goldenowl/LearnConstraint/dev/mock/employees.json"
}

class APIService {
    func getEmployeeList(completion: @escaping (Employees) -> ()) {
        let url = URL(string: API.baseURL)

        guard let url = url else {
            print("URL invalid")
            return
        }
        let request = URLRequest(url: url)

        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                print("error \(error)")
                return
            }
            guard let response = response as? HTTPURLResponse, 200 ..< 300 ~= response.statusCode else {
                print("request error")
                return
            }
            if let data = data {
                print("data = \(data)")
                let jsonDecoder = JSONDecoder()
                let empData: Employees = try! jsonDecoder.decode(Employees.self, from: data)
                print("result = \(empData)")
                completion(empData)
            }

        }.resume()
    }
}
