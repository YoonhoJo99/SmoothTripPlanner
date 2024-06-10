//
//  NewPlanView.swift
//  SmoothTripPlanner
//
//  Created by 조윤호 on 6/11/24.
//

import UIKit
import SnapKit
import Then
import TextFieldEffects

final class NewPlanView: UIView {
    
    // 날짜를 입력 받을 텍스트필드
    // -> 클릭시 캘린더로 날짜를 선택하면 텍스트필드에 2024월 06일 11일 ~ 2024월 06년 14일 이렇게 뜨도록 하고싶어
    // -> 일단 지금은 그냥 텍스트필드만 구현
    private let dateTextField = HoshiTextField().then {
        $0.placeholder = "날짜를 입력해주세요"
        $0.placeholderColor = .gray
        $0.borderActiveColor = .gray
        $0.borderInactiveColor = .gray
        $0.placeholderFontScale = 1
    }
    
    // 여행 장소 입력 텍스트필드
    private let placeTextField = HoshiTextField().then {
        $0.placeholder = "여행 장소를 입력해주세요"
        $0.placeholderColor = .gray
        $0.borderActiveColor = .gray
        $0.borderInactiveColor = .gray
        $0.placeholderFontScale = 1
    }
    
    // 여행 제목 입력 텍스트필드
    private let tripNameTextField = HoshiTextField().then {
        $0.placeholder = "여행 이름을 입력해주세요"
        $0.placeholderColor = .gray
        $0.borderActiveColor = .gray
        $0.borderInactiveColor = .gray
        $0.placeholderFontScale = 1
    }

    // 만들기 버튼
    lazy var makeButton = UIButton().then {
        $0.setTitle("만들기", for: .normal)
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
        addSubview(dateTextField)
        addSubview(placeTextField)
        addSubview(tripNameTextField)
        addSubview(makeButton)
    }
    
    private func setConstraints() {
        dateTextField.snp.makeConstraints {
            $0.top.equalTo(self.safeAreaLayoutGuide).inset(60)
            $0.leading.trailing.equalTo(self.safeAreaLayoutGuide).inset(50)
            $0.height.equalTo(70)
        }
        
        placeTextField.snp.makeConstraints {
            $0.top.equalTo(dateTextField).inset(90)
            $0.leading.trailing.equalTo(self.safeAreaLayoutGuide).inset(50)
            $0.height.equalTo(70)
        }
        
        tripNameTextField.snp.makeConstraints {
            $0.top.equalTo(placeTextField).inset(90)
            $0.leading.trailing.equalTo(self.safeAreaLayoutGuide).inset(50)
            $0.height.equalTo(70)
        }
        
        makeButton.snp.makeConstraints {
            $0.top.equalTo(tripNameTextField).inset(100)
            $0.leading.trailing.equalTo(self.safeAreaLayoutGuide).inset(50)
            $0.height.equalTo(50)
        }
    }
    
    // - 나중에 리팩토링 예정 -
    func getDateTextField() -> String? {
        return dateTextField.text
    }
    
    func getPlaceTextField() -> String? {
        return placeTextField.text
    }
    
    func getTripNameTextField() -> String? {
        return tripNameTextField.text
    }
    
}
