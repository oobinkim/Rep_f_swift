//
//  RegistrationViewModel+sendPhoneNumberVerification.swift
//  repf
//
//  Created by oobin on 12/17/24.
//

import FirebaseAuth

extension RegistrationViewModel{
    // MARK: - Firebase 인증 요청
    func sendPhoneNumberVerification() {
        guard !user.phoneNumber.isEmpty else {
            errorMessage = "휴대폰 번호가 비어 있습니다."
            return
        }

        //  번호+82 형식으로 변환
        let formattedPhoneNumber = formatPhoneNumber(user.phoneNumber)

        guard !formattedPhoneNumber.isEmpty else {
            errorMessage = "잘못된 전화번호 형식입니다."
            return
        }

        isVerificationInProgress = true
        errorMessage = nil

        // Firebase에 인증 요청
        PhoneAuthProvider.provider().verifyPhoneNumber(formattedPhoneNumber, uiDelegate: nil) { verificationID, error in
            DispatchQueue.main.async {
                self.isVerificationInProgress = false
                if let error = error {
                    print("Firebase 인증 실패: \(error.localizedDescription)")
                    self.errorMessage = "인증 요청 실패: \(error.localizedDescription)"
                    return
                }
                self.verificationID = verificationID
                print("인증 ID 발급 완료: \(verificationID ?? "nil")")
                self.goToNextStep()
            }
        }
    }
}
