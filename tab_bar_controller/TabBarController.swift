//
//  TabBarController.swift
//  LearnConstraint
//
//  Created by Golden Owl on 03/10/2022.
//

import UIKit

class TabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        
        let firstVC = FirstViewController()
        let secondVC = SecondViewController()
        let thirdVC = ThirdViewController()
        let fourthVC = UINavigationController(rootViewController: FourthViewController())
        let fifthVC = UINavigationController(rootViewController: FifthViewController())
        
        firstVC.title = "Home"
        secondVC.title = "New"
        thirdVC.title = "Sale"
        fourthVC.title = "About"
        fifthVC.title = "Settings"
        
        self.setViewControllers([firstVC, secondVC, thirdVC, fourthVC, fifthVC], animated: false)
        self.tabBar.backgroundColor = UIColor.white.withAlphaComponent(0.5)
        
        guard let items = self.tabBar.items else { return }
        let images = ["house", "newspaper", "figure.disc.sports", "person", "gear"]
        for (index, item) in items.enumerated() {
            item.image = UIImage(systemName: images[index])
        }
    }
}


class FirstViewController: UIViewController{
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Home"
        view.backgroundColor = .systemBlue
    }
}

class SecondViewController: UIViewController{
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "New"
        view.backgroundColor = .systemYellow
    }
}

class ThirdViewController: UIViewController{
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Sale"
        view.backgroundColor = .systemGray
    }
}

class FourthViewController: UIViewController{
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "About"
        view.backgroundColor = .systemRed
    }
}

class FifthViewController: UIViewController{
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Settings"
        view.backgroundColor = .systemMint
    }
}
