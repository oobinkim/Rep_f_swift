//
//  RegistrationView.swift
//  repf
//
//  Created by oobin on 12/14/24.
//

import SwiftUI

struct RegistrationView: View {
    @StateObject private var viewModel = RegistrationViewModel()
    
    var body: some View {
        VStack {
            if viewModel.currentStep == 1 {
                PersonalInfoView(viewModel: viewModel)
            } else if viewModel.currentStep == 2 {
                PhoneNumberView(viewModel: viewModel)
            } else if viewModel.currentStep == 3 {
                VerificationCodeView(viewModel: viewModel)
            } else if viewModel.currentStep == 4 {
                ComplitionView(viewModel: viewModel)
            }
            Spacer()
        }
        .padding()
        .background(Color.bgBlack.edgesIgnoringSafeArea(.all))
        .foregroundColor(.white)
    }
}


struct RegistrationView_Previews: PreviewProvider {
    static var previews: some View {
        RegistrationView()
    }
}
