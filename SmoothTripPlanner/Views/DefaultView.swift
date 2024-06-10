//
//  DefaultView.swift
//  SmoothTripPlanner
//
//  Created by 조윤호 on 6/10/24.
//

import UIKit

final class DefaultView: UIView {
    
    // 각 라벨들
    
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
       
    }
    
    private func setConstraints() {
        
    }
    
}

