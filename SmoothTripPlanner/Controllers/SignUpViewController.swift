//
//  SignUpViewController.swift
//  SmoothTripPlanner
//
//  Created by 조윤호 on 6/3/24.
//

import UIKit
import FirebaseAuth

class SignUpViewController: UIViewController {

    private let signUpView = SignUpView()
    
    private let signUpManager = SignUpManager()
    
    override func loadView() { // -> viewDidLoad()보다 먼저 호출이 되는 메소드 -> 기본 view를 교체해줄 수 있음
        view = signUpView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupAddTarget()
    }
    
    func setupAddTarget() {
        signUpView.signUpButton.addTarget(self, action: #selector(signUpButtonTapped), for: .touchUpInside)
    }

    @objc func signUpButtonTapped() {
        // 정보 저장
        signUpManager.name = signUpView.getName()
        signUpManager.email = signUpView.getEmail()
        signUpManager.password = signUpView.getPassword()
        signUpManager.confirmPassword = signUpView.getConfirmPassword()
        
        // 정보를 토대로 유효성 검사후 계정 생성
        if signUpManager.isValid() {
            signUpManager.createAccount()
        } else {
            // 유효성 검사 실패 처리
            print("유효성 검사 실패")
        }
    }
    
}
