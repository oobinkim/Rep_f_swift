//
//  RegistrationViewModel.swift
//  repf
//
//  Created by oobin on 12/14/24.
//

import SwiftUI
import FirebaseFirestore

class RegistrationViewModel: ObservableObject {
    
    @Published var user = UserModel()
    @Published var currentStep: Int = 1
    @Published var verificationID: String? // Firebase 인증 ID
    @Published var isVerificationInProgress: Bool = false
    @Published var errorMessage: String?
    
    var db = Firestore.firestore()
    
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
    // MARK: - 성별정보 변환
    func numberToGender() -> String {
        switch self.user.gender {
        case "1", "3", "5", "7":
            return "M" // 남성
        case "0", "9":
            return "??" // 알 수 없음
        default:
            return "F" // 여성
        }
    }
}
