//
//  VerificationCodeView.swift
//  repf
//
//  Created by oobin on 12/14/24.
//

import SwiftUI

struct VerificationCodeView: View {
    @ObservedObject var viewModel: RegistrationViewModel

    var body: some View {
        VStack(spacing: 20) {
            Text("휴대폰 인증화면")
                .font(.title)
                .fontWeight(.bold)
                .multilineTextAlignment(.center)


            Button(action: {
                viewModel.goToNextStep()
            }) {
                Text("다음")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.green)
                    .cornerRadius(10)
            }
            .padding(.horizontal)
        }
    }
}
