//
//  PhoneNumberView.swift
//  repf
//
//  Created by oobin on 12/14/24.
//

import SwiftUI

struct PhoneNumberView: View {
    
    @ObservedObject var viewModel: RegistrationViewModel
    @State private var selectedCarrier: String = "SKT"
    
    var body: some View {
        VStack(spacing: 16) {
            Text("휴대폰 번호를 입력해주세요")
                .font(.custom("Pretendard-Medium", size: 28))
                .fontWeight(.semibold)
                .foregroundColor(.appWhite)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.top, 52)
                .padding(.bottom, 28)
            
            OutLinedTextField(
                text: $viewModel.user.phoneNumber,
                placeholder: "휴대폰번호",
                keyboardType: .namePhonePad,
                maxLength: 11,
                isNumberOnly: true
            )
            .frame(maxWidth: .infinity)
            .padding(.bottom, 8)
            
            HStack(spacing: 0) {
                SegmentStyleButton(title: "SKT", isSelected: selectedCarrier == "SKT", position: .first) {
                    selectedCarrier = "SKT"
                    viewModel.user.carrier = "SKT"
                }
                SegmentStyleButton(title: "KT", isSelected: selectedCarrier == "KT", position: .middle) {
                    selectedCarrier = "KT"
                    viewModel.user.carrier = "KT"
                }
                SegmentStyleButton(title: "LG U+", isSelected: selectedCarrier == "LG U+", position: .middle) {
                    selectedCarrier = "LG U+"
                    viewModel.user.carrier = "LG U+"
                }
                SegmentStyleButton(title: "알뜰폰", isSelected: selectedCarrier == "알뜰폰", position: .last) {
                    selectedCarrier = "알뜰폰"
                    viewModel.user.carrier = "알뜰폰"
                }
            }
            .frame(maxWidth: .infinity)
            .padding(.bottom, 64)
            
            PrimaryButton(
                title: "다음",
                isEnabled: viewModel.isInputValid,
                action: {
                    viewModel.goToNextStep()
                },
                enabledColor: .Primary,
                disabledColor: .primaryDisabled,
                textColor: .textBlack
            )
            Spacer()
        }
        .frame(maxWidth: UIScreen.main.bounds.width * 0.98)
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                CustomBackButton(action: {
                    viewModel.goToPreviousStep()
                })
            }
        }
    }
}

struct PhoneNumberView_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = RegistrationViewModel()
        PhoneNumberView(viewModel: viewModel)
    }
}
