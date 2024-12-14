//
//  PhoneNumberView.swift
//  repf
//
//  Created by oobin on 12/14/24.
//

import SwiftUI

struct PhoneNumberView: View {
    @ObservedObject var viewModel: RegistrationViewModel

    var body: some View {
        VStack(spacing: 20) {
            Text("휴대폰 번호를 입력해주세요")
                .font(.title)
                .fontWeight(.bold)

            TextField("휴대폰 번호", text: $viewModel.user.phoneNumber)
                .keyboardType(.numberPad)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .foregroundColor(.black)
                .padding(.horizontal)

            Picker("통신사 선택", selection: $viewModel.user.carrier) {
                Text("SKT").tag("SKT")
                Text("KT").tag("KT")
                Text("LG U+").tag("LG U+")
                Text("알뜰폰").tag("알뜰폰")
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding(.horizontal)

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

