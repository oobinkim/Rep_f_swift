//
//  RegistrationViewModel+sendPhoneNumberVerification.swift
//  repf
//
//  Created by oobin on 12/17/24.
//

import FirebaseAuth

extension RegistrationViewModel {
    func sendPhoneNumberVerification() {
        guard !user.phoneNumber.isEmpty else {
            errorMessage = "전화번호 없음."
            return
        }

        let formattedPhoneNumber = formatPhoneNumber(user.phoneNumber)

        guard !formattedPhoneNumber.isEmpty else {
            errorMessage = "잘못된 전화번호 형식"
            return
        }

        isVerificationInProgress = true
        errorMessage = nil

        print("인증 요청 시작 - 번호: \(formattedPhoneNumber)")

        FirebaseAuthService.shared.sendPhoneNumberVerification(phoneNumber: formattedPhoneNumber) { [weak self] result in
            guard let self = self else { return }
            
            DispatchQueue.main.async {
                self.isVerificationInProgress = false

                switch result {
                case .success(let verificationID):
                    print("인증 ID 발급 완료: \(verificationID)")
                    self.verificationID = verificationID
                    self.goToNextStep()
                case .failure(let error):
                    print("Firebase 인증 실패: \(error.localizedDescription)")
                    self.errorMessage = "인증 요청 실패: \(error.localizedDescription)"
                }
            }
        }
    }
}
