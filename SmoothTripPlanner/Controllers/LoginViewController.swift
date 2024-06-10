//
//  LoginViewController.swift
//  SmoothTripPlanner
//
//  Created by 조윤호 on 6/2/24.
//

import UIKit
import SnapKit

final class LoginViewController: UIViewController {

    private let loginView = LoginView()
    
    private let loginManager = LoginManager()
    
    override func loadView() { // -> viewDidLoad()보다 먼저 호출이 되는 메소드 -> 기본 view를 교체해줄 수 있음
        view = loginView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupAddTarget()
    }
    
    func setupAddTarget() {
        loginView.loginButton.addTarget(self, action: #selector(loginButtonTapped), for: .touchUpInside)
        loginView.signUpButton.addTarget(self, action: #selector(signUpButtonTapped), for: .touchUpInside)
    }
    
    //
    @objc func loginButtonTapped() {
        // 정보 저장
        loginManager.email = loginView.getEmail()
        loginManager.password = loginView.getPassword()
        
        // 로그인 로직
        guard let email = loginView.getEmail(), !email.isEmpty,
              let password = loginView.getPassword(), !password.isEmpty else {
            
            // 이메일 또는 비밀번호가 입력되지 않은 경우
            print("이메일과 비밀번호를 모두 입력하세요.")
            return
            
        }
        
        // 로그인 매니저를 통해 로그인 시도
        loginManager.signIn { [weak self] success, error in
            // self가 약한 참조로 캡처됩니다.
            guard let self = self else { return } // self가 해제되었으면 클로저 종료
            if let error = error {
                print("로그인 실패:", error.localizedDescription)
                // 로그인 실패 시 사용자에게 알려줄 수 있는 작업 수행
            } else if success {
                print("로그인 성공!")
                // 로그인 성공 시 다음 화면으로 이동 또는 애플리케이션의 메인 기능 활성화
                let mainVC = MainViewController()
                
                // mainManager 초기 셋팅을 여기서 수행
                
                mainVC.modalPresentationStyle = .fullScreen
                present(mainVC, animated: true)
            } else {
                print("로그인 실패: 알 수 없는 오류")
                // 그 외의 이유로 로그인에 실패한 경우
            }
        }
        
    }
    
    //
    @objc func signUpButtonTapped() {
        let signUpVC = SignUpViewController()
//        signUpVC.modalPresentationStyle = .fullScreen
        present(signUpVC, animated: true, completion: nil)
    }

}
