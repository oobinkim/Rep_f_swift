//
//  RegistrationViewModel+verifyCode.swift
//  repf
//
//  Created by oobin on 12/17/24.
//

import FirebaseAuth

extension RegistrationViewModel{
    // MARK: - Firebase 인증 검증
    func verifyCode(verificationCode: String, completion: @escaping (Bool) -> Void) {
        guard let verificationID = verificationID else {
            errorMessage = "재시도 요청"
            completion(false)
            return
        }
        
        let credential = PhoneAuthProvider.provider().credential(withVerificationID: verificationID, verificationCode: verificationCode)
        
        Auth.auth().signIn(with: credential) { authResult, error in
            if let error = error {
                DispatchQueue.main.async {
                    self.errorMessage = "인증번호가 틀렸습니다."
                    print("인증 실패: \(error.localizedDescription)")
                    completion(false)
                }
                return
            }
            
            DispatchQueue.main.async {
                print("인증 성공")
                self.errorMessage = nil
                completion(true)
            }
        }
    }
}
