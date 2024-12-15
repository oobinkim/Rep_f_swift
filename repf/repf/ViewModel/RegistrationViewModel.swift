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

    init() {
        self.user = UserModel()
    }
    
    var isInputValid: Bool {
           return user.name.count >= 3 &&
                  user.birth.count == 6 &&
                  user.gender.count == 1
       }
    
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
