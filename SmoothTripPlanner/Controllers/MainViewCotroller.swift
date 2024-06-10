//
//  MainViewCotroller.swift
//  SmoothTripPlanner
//
//  Created by 조윤호 on 6/10/24.
//

import UIKit

class MainViewController: UIViewController {

    private let mainView = MainView()
    
    private let mainViewManager = MainManager()
    
    override func loadView() { // -> viewDidLoad()보다 먼저 호출이 되는 메소드 -> 기본 view를 교체해줄 수 있음
        view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupAddTarget()
    }
    
    func setupAddTarget() {
       
    }

    @objc func signUpButtonTapped() {
        
    }
}

