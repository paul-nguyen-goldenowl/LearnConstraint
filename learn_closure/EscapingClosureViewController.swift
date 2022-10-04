//
//  EscapingClosureViewController.swift
//  LearnConstraint
//
//  Created by Golden Owl on 04/10/2022.
//

import UIKit

typealias FetchComplete = (UIImage) -> Void

class EscapingClosureViewController: UIViewController {
    lazy var imageView: UIImageView = {
        let imageView = UIImageView()
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.image = UIImage(systemName: "person")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
        
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
            
        view.addSubview(imageView)
        setConstraints()
            
        fetchImage(urlString: "https://i.pinimg.com/originals/0c/b4/8b/0cb48b97d05243da797aff3dac5d43f1.jpg") { image in
            DispatchQueue.main.async {
                self.imageView.image = image
            }
        }
    }
        
    private func fetchImage(urlString: String, complete: @escaping FetchComplete) {
        guard let url = URL(string: urlString) else { return }
            
        (URLSession(configuration: .default).dataTask(with: url, completionHandler: { data, _, _ in
            if let data = data {
                let image = UIImage(data: data)
                if let image = image {
                    complete(image)
                }
            }
        })).resume()
    }
        
    private func setConstraints() {
        imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        imageView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 200).isActive = true
    }
}
