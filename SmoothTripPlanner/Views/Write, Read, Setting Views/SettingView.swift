//
//  SettingView.swift
//  SmoothTripPlanner
//
//  Created by 조윤호 on 6/10/24.
//

import UIKit
import SnapKit
import Then

final class SettingView: UIView {
    
    // 제목 라벨
    private let nameLabel = UILabel().then {
        $0.text = "Setting View" // 제목 미정..
        $0.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1) // 색깔 변경 예정
        $0.font = UIFont.systemFont(ofSize: 40, weight: .heavy)
        $0.textAlignment = .center
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
    }
    
    private func setConstraints() {
        nameLabel.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.centerY.equalToSuperview()
        }
    }
    
}