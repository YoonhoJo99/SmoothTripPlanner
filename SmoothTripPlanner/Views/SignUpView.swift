//
//  SignUpView.swift
//  SmoothTripPlanner
//
//  Created by 조윤호 on 6/3/24.
//

import UIKit
import SnapKit
import TextFieldEffects
import Then

final class SignUpView: UIView {
    
    // 제목 라벨
    private let nameLabel = UILabel().then {
        $0.text = "회원가입" // 제목 미정..
        $0.textColor = #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1) // 색깔 변경 예정
        $0.font = UIFont.systemFont(ofSize: 40, weight: .heavy)
        $0.textAlignment = .center
    }
    
    // 이름 입력 필드
    private let nameTextField = HoshiTextField().then {
        $0.placeholder = "이름을 입력해 주세요"
        $0.placeholderColor = .gray
        $0.borderActiveColor = .gray
        $0.borderInactiveColor = .gray
        $0.placeholderFontScale = 1
    }
    
    // 이메일 입력 필드
    private let emailTextField = HoshiTextField().then {
        $0.placeholder = "이메일을 입력해 주세요"
        $0.placeholderColor = .gray
        $0.borderActiveColor = .gray
        $0.borderInactiveColor = .gray
        $0.placeholderFontScale = 1
    }
    
    // 비밀번호 입력 필드
    private let passwordTextField = HoshiTextField().then {
        $0.placeholder = "패스워드를 입력해 주세요"
        $0.placeholderColor = .gray
        $0.borderActiveColor = .gray
        $0.borderInactiveColor = .gray
        $0.placeholderFontScale = 1
    }
    
    // 비밀번호 재확인 입력 필드
    private let checkPasswordTextField = HoshiTextField().then {
        $0.placeholder = "위와 동일한 패스워드를 입력해 주세요"
        $0.placeholderColor = .gray
        $0.borderActiveColor = .gray
        $0.borderInactiveColor = .gray
        $0.placeholderFontScale = 1
    }
    
    // 회원가입 버튼
    lazy var signUpButton = UIButton().then {
        $0.setTitle("회원가입", for: .normal)
        $0.setTitleColor(.white, for: .normal)
        $0.backgroundColor = #colorLiteral(red: 0.5568627715, green: 0.3529411852, blue: 0.9686274529, alpha: 1)
        $0.titleLabel?.font = UIFont.systemFont(ofSize: 20)
        $0.layer.cornerRadius = 5
    }
    
    // 네비게이션 바

    
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
        addSubview(nameTextField)
        addSubview(emailTextField)
        addSubview(passwordTextField)
        addSubview(checkPasswordTextField)
        addSubview(signUpButton)
    }
    
    private func setConstraints() {
        nameLabel.snp.makeConstraints {
            $0.top.equalTo(self.safeAreaLayoutGuide).inset(140)
            $0.leading.trailing.equalTo(self.safeAreaLayoutGuide).inset(100)
        }
        
        nameTextField.snp.makeConstraints {
            $0.top.equalTo(nameLabel).inset(80)
            $0.leading.trailing.equalTo(self.safeAreaLayoutGuide).inset(40)
            $0.height.equalTo(70)
        }
        
        emailTextField.snp.makeConstraints {
            $0.top.equalTo(nameTextField).inset(80)
            $0.leading.trailing.equalTo(self.safeAreaLayoutGuide).inset(40)
            $0.height.equalTo(70)
        }
        
        passwordTextField.snp.makeConstraints {
            $0.top.equalTo(emailTextField).inset(80)
            $0.leading.trailing.equalTo(self.safeAreaLayoutGuide).inset(40)
            $0.height.equalTo(70)
        }
        
        checkPasswordTextField.snp.makeConstraints {
            $0.top.equalTo(passwordTextField).inset(80)
            $0.leading.trailing.equalTo(self.safeAreaLayoutGuide).inset(40)
            $0.height.equalTo(70)
        }
    
        signUpButton.snp.makeConstraints {
            $0.top.equalTo(checkPasswordTextField).inset(120)
            $0.leading.trailing.equalTo(self.safeAreaLayoutGuide).inset(40)
            $0.height.equalTo(50)
        }
    }
}
