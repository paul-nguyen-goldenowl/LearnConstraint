//
//  GCDViewController.swift
//  LearnConstraint
//
//  Created by Golden Owl on 03/10/2022.
//

import UIKit

class DispatchMainViewController: UIViewController {
    lazy var imageView : UIImageView = {
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
        
        fetchImage(urlString: "https://i.pinimg.com/originals/0c/b4/8b/0cb48b97d05243da797aff3dac5d43f1.jpg")
    }
    
    private  func fetchImage(urlString: String) {
        let url = URL(string: urlString)
        
        (URLSession(configuration: .default).dataTask(with: url!, completionHandler: { (data, response, error) in
            if let data = data {
                let image = UIImage(data: data)
                
                DispatchQueue.main.async {
                    self.imageView.image = image
                }
            }
        })).resume()
    }
    
    private func setConstraints(){
        imageView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        imageView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        imageView.widthAnchor.constraint(equalToConstant: 200).isActive = true
    }
    
}
