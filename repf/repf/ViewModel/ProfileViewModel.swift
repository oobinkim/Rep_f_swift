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
    @Published var currentStep: Int = 1
    let totalSteps: Int = 5
    
    // MARK: - 모델
    init() {
        self.profile = ProfileModel()
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
    // MARK: - 스텝 progress 계산
    var progress: Double {
        Double(currentStep) / Double(totalSteps)
    }
}

