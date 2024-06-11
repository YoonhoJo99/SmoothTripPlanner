//
//  PlanViewCell.swift
//  SmoothTripPlanner
//
//  Created by 조윤호 on 6/12/24.
//

import UIKit
import Then
import SnapKit

final class PlanViewCell: UITableViewCell {
    
    // dateLabel
    private let dateLabel = UILabel().then {
        $0.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        $0.font = UIFont.systemFont(ofSize: 16, weight: .heavy)
        $0.textAlignment = .left
    }
    
    // placeLabel
    private let placeLabel = UILabel().then {
        $0.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        $0.font = UIFont.systemFont(ofSize: 10, weight: .heavy)
        $0.textAlignment = .left
    }
    
    // nameLabel
    private let nameLabel = UILabel().then {
        $0.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        $0.font = UIFont.systemFont(ofSize: 14, weight: .heavy)
        $0.textAlignment = .left
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addSubviews()
        setupConstraints()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func addSubviews() {
        addSubview(dateLabel)
        addSubview(placeLabel)
        addSubview(nameLabel)
    }
    
    private func setupConstraints() {
        dateLabel.snp.makeConstraints {
            $0.top.equalTo(self.safeAreaLayoutGuide).inset(6)
            $0.leading.equalTo(self.safeAreaLayoutGuide).inset(4)
        }
        
        placeLabel.snp.makeConstraints {
            $0.bottom.equalTo(self.safeAreaLayoutGuide).inset(4)
            $0.leading.equalTo(self.safeAreaLayoutGuide).inset(4)
        }
        
        nameLabel.snp.makeConstraints {
            $0.trailing.equalTo(self.safeAreaLayoutGuide).inset(4)
            $0.bottom.equalTo(self.safeAreaLayoutGuide).inset(4)
        }
    }
    
    func configure(with plan: Plan) {
        dateLabel.text = "\(plan.date)"
        placeLabel.text = "\(plan.place)"
        nameLabel.text = "\(plan.tripName)"
    }
}

