//
//  NetworkViewController.swift
//  LearnConstraint
//
//  Created by Golden Owl on 05/10/2022.
//

import UIKit

struct Post: Codable {
    let userId: Int
    let id: Int
    let title: String
    let body: String
}

class NetworkViewController: UIViewController {
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

        self.fetchPosts { [weak self] listPost in
            guard let self = self else { return }
            self.posts.append(contentsOf: listPost)
            print("Result: \(self.posts)")
            DispatchQueue.main.async {
                self.tabelView.reloadData()
                self.indicatorView.isHidden = true
            }
        }
    }

    private func fetchPosts(completeHandler: @escaping ([Post]) -> Void) {
        let url = URL(string: "https://jsonplaceholder.typicode.com/posts")
        guard let url = url else { return }
        let request = URLRequest(url: url)
        URLSession.shared.dataTask(with: request) { data, response, error in
            if let error = error {
                print("Error \(error)")
                completeHandler([])
                return
            }

            guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200, let data = data else {
                print("Response fail")
                completeHandler([])
                return
            }

            do {
                let decodedData = try JSONDecoder().decode([Post].self, from: data)
                completeHandler(decodedData)
            } catch {
                print("Error \(error)")
                completeHandler([])
            }
        }
        .resume()
    }
}

extension NetworkViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.posts.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "mycell", for: indexPath)
        cell.textLabel?.text = self.posts[indexPath.row].title
        return cell
    }
}
