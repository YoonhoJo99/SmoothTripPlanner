//
//  SignUpViewController.swift
//  SmoothTripPlanner
//
//  Created by 조윤호 on 6/3/24.
//

import UIKit

class SignUpViewController: UIViewController {

    private let signUpView = SignUpView()
    
    override func loadView() { // -> viewDidLoad()보다 먼저 호출이 되는 메소드 -> 기본 view를 교체해줄 수 있음
        view = signUpView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupAddTarget()
    }
    
    func setupAddTarget() {
        
    }

}
