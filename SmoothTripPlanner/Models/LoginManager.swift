//
//  LoginManager.swift
//  SmoothTripPlanner
//
//  Created by 조윤호 on 6/3/24.
//

import Foundation
import FirebaseAuth

final class LoginManager {
    var email: String?
    var password: String?
    
    // 이메일과 비밀번호를 사용하여 로그인 시도
    func signIn(completion: @escaping (Bool, Error?) -> Void) {
        guard let email = self.email, let password = self.password else { return }
        
        Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
            if let error = error {
                // 로그인 실패
                completion(false, error)
            } else {
                // 로그인 성공
                completion(true, nil)
            }
        }
    }
}
