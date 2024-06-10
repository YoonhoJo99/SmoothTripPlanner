//
//  NewPlanController.swift
//  SmoothTripPlanner
//
//  Created by 조윤호 on 6/11/24.
//

import UIKit

class NewPlanViewController: UIViewController {

    private let newPlanView = NewPlanView()
    
    private let newPlanManager = NewPlanManager()
    
    override func loadView() { // -> viewDidLoad()보다 먼저 호출이 되는 메소드 -> 기본 view를 교체해줄 수 있음
        view = newPlanView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupAddTarget()
    }
    
    func setupAddTarget() {
        newPlanView.makeButton.addTarget(self, action: #selector(makeButtonTapped), for: .touchUpInside)
    }
    
    //
    @objc func makeButtonTapped() {
        print("만들기 버튼 클릭")
        
        // 데이터를 저장
        newPlanManager.setDate(from: newPlanView.getDateTextField())
        newPlanManager.setPlace(newPlanView.getPlaceTextField())
        newPlanManager.setTripName(newPlanView.getTripNameTextField())
        
        // 파이어베이스 스토어에 데이터 저장 -- 여기서부터
        print("데이터 저장--")
        print("\(newPlanManager.getPlan())")
        
    }

}


