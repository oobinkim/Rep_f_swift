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
            Text("휴대폰 인증이 완료되었습니다!")
                .font(.title)
                .fontWeight(.bold)
                .multilineTextAlignment(.center)

            Text("다음 단계로 진행해 주세요.")
                .font(.body)
                .multilineTextAlignment(.center)

            Image(systemName: "checkmark.seal.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)
                .foregroundColor(.green)
                .padding()

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
