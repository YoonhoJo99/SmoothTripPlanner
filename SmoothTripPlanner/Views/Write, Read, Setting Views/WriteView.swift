//
//  WriteView.swift
//  SmoothTripPlanner
//
//  Created by 조윤호 on 6/10/24.
//

import UIKit
import SnapKit
import Then

final class WriteView: UIView {
    
    // 플로팅 버튼
    lazy var floatingButton = UIButton(type: .custom).then {
        $0.backgroundColor = #colorLiteral(red: 0.25, green: 0.47, blue: 0.85, alpha: 1) // 버튼 색상
        $0.setTitle("+", for: .normal) // 버튼 제목
        $0.setTitleColor(.white, for: .normal) // 버튼 제목 색상
        $0.titleLabel?.font = UIFont.systemFont(ofSize: 24, weight: .bold) // 버튼 제목 폰트
        $0.layer.cornerRadius = 30 // 버튼을 원형으로 만들기 위해 cornerRadius를 반으로 설정
        $0.layer.shadowColor = UIColor.black.cgColor // 그림자 색상
        $0.layer.shadowOpacity = 0.3 // 그림자 불투명도
        $0.layer.shadowOffset = CGSize(width: 2, height: 2) // 그림자 오프셋
        $0.layer.shadowRadius = 3 // 그림자 반경
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
        addSubview(floatingButton)
    }
    
    private func setConstraints() {
        floatingButton.snp.makeConstraints {
            $0.width.height.equalTo(60) // 버튼 크기
            $0.trailing.equalToSuperview().inset(20) // 오른쪽에서 20포인트 떨어짐
            $0.bottom.equalTo(self.safeAreaLayoutGuide).inset(30) // 아래에서 30포인트 떨어짐
        }
    }
}

