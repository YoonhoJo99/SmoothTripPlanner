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
    
    override func loadView() { // -> viewDidLoad()보다 먼저 호출이 되는 메소드 -> 기본 view를 교체해줄 수 있음
        view = loginView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupAddTarget()
    }
    
    func setupAddTarget() {
        loginView.signUpButton.addTarget(self, action: #selector(signUpButtonTapped), for: .touchUpInside)
    }
    
    @objc func signUpButtonTapped() {
        let signUpVC = SignUpViewController()
        signUpVC.modalPresentationStyle = .fullScreen
        present(signUpVC, animated: true, completion: nil)
    }

}
