//
//  ComplitionView.swift
//  repf
//
//  Created by oobin on 12/14/24.
//

import SwiftUI

struct ComplitionView: View {
    @ObservedObject var viewModel: RegistrationViewModel

    var body: some View {
        VStack(spacing: 20) {
            Text("인증에 성공했어요!")
                .font(.title)
                .fontWeight(.bold)

            Text("서비스 이용에 도움드릴 수 있어요.")
                .multilineTextAlignment(.center)

            Button(action: {
                viewModel.goToNextStep()
            }) {
                Text("1분만에 프로필 설정하기")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.green)
                    .cornerRadius(10)
            }
            .padding(.horizontal)
        }
    }
}
