//
//  SignUpManager.swift
//  SmoothTripPlanner
//
//  Created by 조윤호 on 6/3/24.
//

import Foundation
import FirebaseAuth

final class SignUpManager {
    var name: String? = nil
    var email: String? = nil
    var password: String? = nil
    var confirmPassword: String? = nil
    
    func isValid() -> Bool {
        guard let name = name, !name.isEmpty,
              let email = email, isValidEmail(email),
              let password = password, password.count >= 6,
              let confirmPassword = confirmPassword, password == confirmPassword else { return false }
        return true
    }
    
    private func isValidEmail(_ email: String) -> Bool {
        // 이메일 유효성 검사 (정규식 사용)
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,64}"
        let emailPred = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        return emailPred.evaluate(with: email)
    }
    
    func createAccount() {
        guard let email = self.email, let password = self.password else { return }
        
        Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
            if let error = error {
                // 계정 생성 실패 처리
                print("계정 생성 실패: \(error.localizedDescription)")
                return
            }
            
            // 계정 생성 성공 처리
            print("계정 생성 성공")
            
            // 사용자 추가 정보 저장 (예: 이름)
            if let user = authResult?.user {
                let changeRequest = user.createProfileChangeRequest()
                changeRequest.displayName = self.name
                changeRequest.commitChanges { error in
                    if let error = error {
                        print("프로필 업데이트 실패: \(error.localizedDescription)")
                    } else {
                        print("프로필 업데이트 성공")
                    }
                }
            }
        }
    }
    
}
