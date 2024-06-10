//
//  MainViewCotroller.swift
//  SmoothTripPlanner
//
//  Created by 조윤호 on 6/10/24.
//

import UIKit

class MainViewController: UIViewController {
    
    private let mainViewManager = MainManager()
    
//    override func loadView() { // -> viewDidLoad()보다 먼저 호출이 되는 메소드 -> 기본 view를 교체해줄 수 있음
//        view = 
//    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let tabBarVC = UITabBarController()
        
        // Write View Controller
        let writeVC = WriteViewController()
        writeVC.tabBarItem = UITabBarItem(title: "Write", image: UIImage(systemName: "pencil"), tag: 0)
        
        // Read View Controller, Root 설정
        let readVC =  UINavigationController(rootViewController: ReadViewController())
        readVC.tabBarItem = UITabBarItem(title: "Read", image: UIImage(systemName: "book"), tag: 1)
        
        // Setting View Controller
        let settingVC = SettingViewController()
        settingVC.tabBarItem = UITabBarItem(title: "Setting", image: UIImage(systemName: "gearshape"), tag: 2)
        
        // Adding View Controllers to TabBar
        tabBarVC.setViewControllers([writeVC, readVC, settingVC], animated: false)
        
        // Set initial selected tab to Read
        tabBarVC.selectedIndex = 1
        
        // Add TabBar as Child View Controller
        addChild(tabBarVC)
        view.addSubview(tabBarVC.view)
        tabBarVC.didMove(toParent: self)
        
        // Set constraints for tabBarVC's view
        tabBarVC.view.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            tabBarVC.view.topAnchor.constraint(equalTo: view.topAnchor),
            tabBarVC.view.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            tabBarVC.view.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            tabBarVC.view.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }

    
    func setupAddTarget() {
       
    }


}

