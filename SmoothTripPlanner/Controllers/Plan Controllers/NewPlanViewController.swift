//
//  NewPlanController.swift
//  SmoothTripPlanner
//
//  Created by 조윤호 on 6/11/24.
//

import UIKit
import FirebaseFirestore
import FirebaseAuth

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
    
    @objc func makeButtonTapped() {
        print("만들기 버튼 클릭")
        
        let tripName = newPlanView.getTripNameTextField()
        let tripPlace = newPlanView.getPlaceTextField()
        let startDate = newPlanManager.getStartDate() ?? Date()
        let endDate = newPlanManager.getEndDate() ?? Date()
        
        saveTripPlan(tripName: tripName ?? "", startDate: startDate, endDate: endDate, place: tripPlace ?? "")
    }
    
    // 나중에 유저 정보 저장할 일 있으면 사용
    //    func saveUserData() {
    //        guard let user = Auth.auth().currentUser else {
    //            print("사용자가 로그인되어 있지 않습니다.")
    //            return
    //        }
    //        let userId = user.uid
    //        let userEmail = user.email ?? "unknown"
    //        let userName = user.displayName ?? ""
    //
    //        let userData: [String: Any] = [
    //            "email": userEmail,
    //            "name": userName
    //        ]
    //
    //        let db = Firestore.firestore()
    //        db.collection("users").document(userId).setData(userData) { error in
    //            if let error = error {
    //                print("Error saving user data: \(error.localizedDescription)")
    //            } else {
    //                print("사용자 데이터 저장 완료")
    //            }
    //        }
    //    }
    
    func saveTripPlan(tripName: String, startDate: Date, endDate: Date, place: String) {
        guard let user = Auth.auth().currentUser else {
            print("사용자가 로그인되어 있지 않습니다.")
            return
        }
        
        let userId = user.uid
        
        let tripData: [String: Any] = [
            "userId": userId,
            "tripName": tripName,
            "startDate": startDate,
            "endDate": endDate,
            "place": place
        ]
        
        let db = Firestore.firestore()
        
        // 여행 계획 추가
        let tripRef = db.collection("tripPlans").document()
        
        db.runTransaction({ (transaction, errorPointer) -> Any? in
            transaction.setData(tripData, forDocument: tripRef)
            
            // 세부 여행 계획 추가
            let itineraryData: [String: Any] = [
                "name": "세부 여행 계획 이름",
                "date": Date()
            ]
            let itineraryRef = tripRef.collection("itineraries").document()
            transaction.setData(itineraryData, forDocument: itineraryRef)
            
            return nil
        }) { (object, error) in
            if let error = error {
                print("Transaction failed: \(error.localizedDescription)")
            } else {
                print("여행 계획 및 세부 여행 계획 저장 완료")
            }
        }
        
        // 데이터 추가 후화면 이동
        let wrtieVC = WriteViewController() // 1. 객체생성
        wrtieVC.modalPresentationStyle = .fullScreen // 2. 변경할 화면 설정
        present(wrtieVC, animated: true, completion: nil) // 3. 다음 화면으로 넘어가기
    }

    
}
