//
//  NewPlanManager.swift
//  SmoothTripPlanner
//
//  Created by 조윤호 on 6/11/24.
//

import Foundation

final class NewPlanManager {
    
    private var startDate: Date? // 여행 시작 날짜
    private var endDate: Date? // 여행 종료 날짜
    private var place: String?
    private var tripName: String?
    
    // 시작 날짜와 종료 날짜를 설정하는 메서드
    func setDate(from dateString: String?) {
        // 날짜를 파싱하기 위한 DateFormatter 생성
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "ko_KR") // 날짜 형식이 한국어로 제공된다고 가정
        dateFormatter.dateFormat = "yyyy년 MM월 dd일"
        
        // 날짜 문자열을 공백을 기준으로 나누어 시작 날짜와 종료 날짜 추출
        let dateComponents = dateString!.components(separatedBy: " ~ ")
        
        // 시작 날짜와 종료 날짜를 Date 객체로 변환하여 저장
        if let startDateString = dateComponents.first, let endDateString = dateComponents.last {
            startDate = dateFormatter.date(from: startDateString)
            endDate = dateFormatter.date(from: endDateString)
        }
    }
    
    // 여행 장소를 설정하는 메서드
    func setPlace(_ place: String?) {
        self.place = place
    }
    
    // 여행 이름을 설정하는 메서드
    func setTripName(_ tripName: String?) {
        self.tripName = tripName
    }
    
    //
    func getStartDate() -> Date? {
        return startDate
    }
    
    //
    func getEndDate() -> Date? {
        return endDate
    }
    
    //
    func getPlace() -> String? {
        return place
    }
    
    //
    func getTripName() -> String? {
        return tripName
    }
    
    // 저장된 여행 정보를 반환하는 메서드
    func getPlan() -> (startDate: Date?, endDate: Date?, place: String?, tripName: String?) {
        return (startDate, endDate, place, tripName)
    }
}


