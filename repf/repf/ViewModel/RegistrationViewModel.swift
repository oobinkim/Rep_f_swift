//
//  RegistrationViewModel.swift
//  repf
//
//  Created by oobin on 12/14/24.
//

import SwiftUI
import FirebaseAuth

class RegistrationViewModel: ObservableObject {
    
    @Published var user = UserModel()
    @Published var currentStep: Int = 1
    @Published var verificationID: String? // Firebase 인증 ID
    @Published var isVerificationInProgress: Bool = false
    @Published var errorMessage: String?

    // MARK: - 모델
    init() {
        self.user = UserModel()
    }

    // MARK: - 입력 확인
    var isInputValidInfo: Bool {
        return user.name.count >= 3 &&
               user.birth.count == 6 &&
               user.gender.count == 1
    }
    
    var isInputValidPhoneNumber: Bool {
        return user.phoneNumber.count == 11
    }
    
    var isInPutVerificationCode: Bool {
        return user.verificationCode.count == 6
    }
    // MARK: - 스텝 이동
    func goToNextStep() {
        if currentStep < 4 {
            currentStep += 1
        }
    }

    func goToPreviousStep() {
        if currentStep > 1 {
            currentStep -= 1
        }
    }

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

    // MARK: - 전화번호 포맷 변환
    func formatPhoneNumber(_ phoneNumber: String) -> String {
        var trimmedNumber = phoneNumber.trimmingCharacters(in: .whitespacesAndNewlines)
        // 전화번호 형식 검사 및 변환
        if trimmedNumber.hasPrefix("0") {
            // "01012345678" → "+821012345678"
            trimmedNumber.removeFirst()
            return "+82" + trimmedNumber
        } else if trimmedNumber.hasPrefix("+82") {
            // 이미 +82 국가 코드가 있는 경우
            return trimmedNumber
        } else {
            return "" // 잘못된 형식
        }
    }

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
