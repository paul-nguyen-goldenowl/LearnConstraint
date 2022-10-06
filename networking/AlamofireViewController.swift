//
//  AlamofireViewController.swift
//  LearnConstraint
//
//  Created by Golden Owl on 06/10/2022.
//

import Alamofire
import UIKit

class AlamofireViewController: UIViewController {
    var posts = [Post]()

    lazy var tabelView: UITableView = {
        let tableView = UITableView()
        tableView.dataSource = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "mycell")
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()

    lazy var indicatorView: UIActivityIndicatorView = {
        let indicatorView = UIActivityIndicatorView(style: .large)
        indicatorView.startAnimating()
        indicatorView.color = .red
        indicatorView.translatesAutoresizingMaskIntoConstraints = false
        return indicatorView
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(self.tabelView)
        view.addSubview(self.indicatorView)

        NSLayoutConstraint.activate([
            self.tabelView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            self.tabelView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            self.tabelView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            self.tabelView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            self.indicatorView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            self.indicatorView.centerYAnchor.constraint(equalTo: view.centerYAnchor)
        ])

        NetworkManager.shared.fetchPosts { [weak self] result in
            DispatchQueue.main.async {
                guard let self = self else { return }
                switch result {
                case let .success(result):
                    self.posts.append(contentsOf: result)
                    self.tabelView.reloadData()
                    self.indicatorView.isHidden = true
                case let .failure(error):
                    print("Error \(error.localizedDescription)")
                }
            }
        }
    }
}

extension AlamofireViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.posts.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "mycell", for: indexPath)
        cell.textLabel?.text = self.posts[indexPath.row].title
        return cell
    }
}
