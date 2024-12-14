//
//  RegistrationViewModel.swift
//  repf
//
//  Created by oobin on 12/14/24.
//

import SwiftUI

class RegistrationViewModel: ObservableObject {
    @Published var user = UserModel()
    @Published var currentStep: Int = 1

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
}
