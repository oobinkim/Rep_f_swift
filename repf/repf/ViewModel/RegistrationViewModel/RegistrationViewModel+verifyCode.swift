//
//  RegistrationViewModel+verifyCode.swift
//  repf
//
//  Created by oobin on 12/17/24.
//

import FirebaseAuth

extension RegistrationViewModel {
    // MARK: - Firebase 인증 검증
    func verifyCode(verificationCode: String, completion: @escaping (Bool) -> Void) {
        guard let verificationID = verificationID else {
            errorMessage = "재시도 요청"
            completion(false)
            return
        }

        FirebaseAuthService.shared.verifyCode(verificationID: verificationID, verificationCode: verificationCode) { [weak self] result in
            guard let self = self else { return }
            
            DispatchQueue.main.async {
                switch result {
                case .success(let authResult):
                    print("인증 성공: \(authResult.user.uid)")
                    self.errorMessage = nil
                    completion(true)
                case .failure(let error):
                    print("인증 실패: \(error.localizedDescription)")
                    self.errorMessage = "인증번호가 틀렸습니다."
                    completion(false)
                }
            }
        }
    }
}
