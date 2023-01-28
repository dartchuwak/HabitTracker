//
//  TabBarController.swift
//  HabitTracker
//
//  Created by Evgenii Mikhailov on 09.12.2022.
//

import UIKit


class TabBarController: UITabBarController {
    override func viewDidLoad() {
        super.viewDidLoad()
//        if #available(iOS 15.0, *) {
//            let appearance = UITabBarAppearance()
//            appearance.configureWithOpaqueBackground()
//            appearance.backgroundColor = UIColor(white: 1, alpha: 1)
//            tabBar.standardAppearance = appearance
//            tabBar.scrollEdgeAppearance = tabBar.standardAppearance
//        }
        
        
        viewControllers = [createNavigationController(viewController: HabitsViewController(), title: "Today", image: "circle"),
                           createNavigationController(viewController: InfoViewController(), title: "Info", image: "info"),
                           ]
    }
    
    
    fileprivate func createNavigationController( viewController: UIViewController, title: String , image: String) -> UIViewController {
        let navController = UINavigationController(rootViewController: viewController)
        navController.navigationBar.prefersLargeTitles = false
        viewController.navigationItem.title = title
        navController.tabBarItem.title = title
        navController.tabBarItem.image = UIImage(systemName: image)
        navController.navigationBar.backgroundColor = .white
        return navController
    }
}
