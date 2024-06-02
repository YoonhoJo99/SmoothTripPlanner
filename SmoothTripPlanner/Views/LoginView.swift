//
//  LoginView.swift
//  SmoothTripPlanner
//
//  Created by 조윤호 on 6/2/24.
//

import UIKit
import SnapKit
import TextFieldEffects
import Then

final class LoginView: UIView {
    
    // 제목
    private let nameLabel = UILabel().then {
        $0.text = "ABCDE" // 제목 미정..
        $0.textColor = #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1) // 색깔 변경 예정
        $0.font = UIFont.systemFont(ofSize: 40, weight: .heavy)
        $0.textAlignment = .center
    }
    
    // 로그인 입력 필드
    private let emailTextField = HoshiTextField().then {
        $0.placeholder = "로그인"
        $0.placeholderColor = .gray
        $0.borderActiveColor = .gray
        $0.borderInactiveColor = .gray
        $0.placeholderFontScale = 1
    }
    
    // 비밀번호 입력 필드
    private let passwordTextField = HoshiTextField().then {
        $0.placeholder = "패스워드"
        $0.placeholderColor = .gray
        $0.borderActiveColor = .gray
        $0.borderInactiveColor = .gray
        $0.placeholderFontScale = 1
    }
    
    // 로그인 버튼
    private let loginButton = UIButton().then {
        $0.setTitle("로그인", for: .normal)
        $0.setTitleColor(.white, for: .normal)
        $0.backgroundColor = #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)
        $0.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        $0.layer.cornerRadius = 5
    }
    
    // 회원가입 버튼
    private let signupButton = UIButton().then {
        $0.setTitle("회원가입", for: .normal)
        $0.setTitleColor(.white, for: .normal)
        $0.backgroundColor = #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)
        $0.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        $0.layer.cornerRadius = 5
    }
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setUp()
        addViews()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func setUp() {
        self.backgroundColor = .white
    }
    
    private func addViews() {
        addSubview(nameLabel)
        addSubview(emailTextField)
        addSubview(passwordTextField)
        addSubview(loginButton)
        addSubview(signupButton)
    }
    
    private func setConstraints() {
        nameLabel.snp.makeConstraints {
            $0.top.equalTo(self.safeAreaLayoutGuide).inset(140)
            $0.leading.trailing.equalTo(self.safeAreaLayoutGuide).inset(100)
        }
        
        emailTextField.snp.makeConstraints {
            $0.top.equalTo(nameLabel).inset(80)
            $0.leading.trailing.equalTo(self.safeAreaLayoutGuide).inset(40)
            $0.height.equalTo(70)
        }
        
        passwordTextField.snp.makeConstraints {
            $0.top.equalTo(emailTextField).inset(80)
            $0.leading.trailing.equalTo(self.safeAreaLayoutGuide).inset(40)
            $0.height.equalTo(70)
        }
        
        loginButton.snp.makeConstraints {
            $0.top.equalTo(passwordTextField).inset(100)
            $0.leading.trailing.equalTo(self.safeAreaLayoutGuide).inset(40)
            $0.height.equalTo(50)
        }
        
        signupButton.snp.makeConstraints {
            $0.top.equalTo(loginButton).inset(70)
            $0.leading.trailing.equalTo(self.safeAreaLayoutGuide).inset(40)
            $0.height.equalTo(50)
        }
        
    }
}
