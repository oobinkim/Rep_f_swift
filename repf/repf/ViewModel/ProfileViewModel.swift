//
//  ProfileViewModel.swift
//  repf
//
//  Created by oobin on 12/17/24.
//

import SwiftUI
import FirebaseFirestore

class ProfileViewModel: ObservableObject {
    
    @Published var profile = ProfileModel()
    @Published var species = Species()
    @Published var currentStep: Int = 1
    @Published var totalSteps: Int = 5
    
    // MARK: - 사업자 첫 세자리
    @Published var bizRegHead: String = "" {
        didSet {
            updateBusinessNumber()
        }
    }
    // MARK: - 사업자 가운데 두자리
    @Published var bizRegMiddle: String = "" {
        didSet {
            updateBusinessNumber()
        }
    }
    // MARK: - 사업자 마지막 다섯자리
    @Published var bizRegFoot: String = "" {
        didSet {
            updateBusinessNumber()
        }
    }
    
    // MARK: - 모델 초기화
    init() {
        self.profile = ProfileModel()
    }
    
    // MARK: - 입력 확인
    var isInputValid: Bool {
        return bizRegHead.count >= 3 &&
        bizRegMiddle.count == 2 &&
        bizRegFoot.count == 5
    }
    
    // MARK: - 스텝 이동
    func goToNextStep() {
        if currentStep < totalSteps {
            currentStep += 1
        }
    }
    
    func goToPreviousStep() {
        if currentStep > 1 {
            currentStep -= 1
        }
    }
    
    // MARK: - 스텝 Progress 계산
    var progress: Double {
        Double(currentStep) / Double(totalSteps)
    }
    
    // MARK: - Business Number 업데이트
    private func updateBusinessNumber() {
        profile.businessNumber = "\(bizRegHead)\(bizRegMiddle)\(bizRegFoot)"
    }
}
