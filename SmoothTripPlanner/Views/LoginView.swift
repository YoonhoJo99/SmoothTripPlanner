//
//  LoginView.swift
//  SmoothTripPlanner
//
//  Created by 조윤호 on 6/2/24.
//

import UIKit
import SnapKit
import TextFieldEffects

final class LoginView: UIView {
    
    // StackView 생성
    private let stackView: UIStackView = {
        let sv = UIStackView()
        sv.axis = .vertical
        sv.alignment = .center
        sv.spacing = 20 // 각 뷰 사이의 간격
        return sv
    }()
    
    // 이메일 입력 필드 생성
    private let emailTextField: HoshiTextField = {
        let textField = HoshiTextField()
        textField.placeholder = "이메일"
        textField.borderActiveColor = .blue // 활성 상태일 때의 테두리 색상
        textField.borderInactiveColor = .gray // 비활성 상태일 때의 테두리 색상
        return textField
    }()
    
    // 비밀번호 입력 필드 생성
    private let passwordTextField: HoshiTextField = {
        let textField = HoshiTextField()
        textField.placeholder = "비밀번호"
        textField.isSecureTextEntry = true // 비밀번호 입력을 숨김
        textField.borderActiveColor = .blue // 활성 상태일 때의 테두리 색상
        textField.borderInactiveColor = .gray // 비활성 상태일 때의 테두리 색상
        return textField
    }()
    
    // 로그인 버튼 생성
    private let registerButton: UIButton = {
        let button = UIButton()
        button.setTitle("회원가입", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .blue
        return button
    }()
    
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
        // StackView에 입력 필드, 버튼, 레이블 추가
        stackView.addArrangedSubview(emailTextField)
        stackView.addArrangedSubview(passwordTextField)
        stackView.addArrangedSubview(registerButton)
        
        // StackView를 뷰에 추가
        addSubview(stackView)
    }
    
    private func setConstraints() {
        // StackView의 제약 조건 설정
        stackView.snp.makeConstraints { make in
            make.centerX.centerY.equalToSuperview()
        }
    }
}

