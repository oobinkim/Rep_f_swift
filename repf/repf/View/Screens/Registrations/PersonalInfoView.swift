//
//  PersonalInfoView.swift
//  repf
//
//  Created by oobin on 12/14/24.
//

import SwiftUI

struct PersonalInfoView: View {
    
    @ObservedObject var viewModel: RegistrationViewModel
    @State private var isInputedText = false
    @Environment(\.presentationMode) var presentationMode
    @FocusState private var isFocused: Bool
    
    var body: some View {
        VStack(spacing: 20) {
            // 상단 제목
            VStack(spacing: 8) {
                Text("본인 확인이 필요해요")
                    .font(.custom("Pretendard-Medium", size: 24))
                    .fontWeight(.semibold)
                    .foregroundColor(.appWhite)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            .padding(.top, 68)
            .padding(.bottom, 28)
            
            // 입력 필드
            VStack(spacing: 32) {
                // 이름 입력 필드
                VStack(alignment: .leading, spacing: 10) {
                    Text("이름")
                        .font(.custom("Pretendard-Medium", size: 16))
                        .foregroundColor(.appWhite)
                    
                    OutLinedTextField(
                        text: $viewModel.user.name,
                        placeholder: "이름",
                        keyboardType: .default,
                        maxLength: 15,
                        isNumberOnly: false
                    )
                    .frame(maxWidth: .infinity)
                }
                
                // 주민등록번호 입력 필드
                VStack(alignment: .leading, spacing: 10) {
                    Text("주민등록번호")
                        .font(.custom("Pretendard-Medium", size: 16))
                        .foregroundColor(.appWhite)
                    
                    HStack(spacing: 8) {
                        // 생년월일 앞 6자리 입력 필드
                        OutLinedTextField(
                            text: $viewModel.user.birth,
                            placeholder: "생년월일 앞 6자리",
                            keyboardType: .numberPad,
                            maxLength: 6,
                            isNumberOnly: true
                        )
                        .frame(maxWidth: .infinity)
                        
                        // - 기호
                        Text("-")
                            .font(.title2)
                            .foregroundColor(.appWhite)
                            .frame(width: 10)
                        
                        // 성별 필드
                        OutLinedTextField(
                            text: $viewModel.user.gender,
                            placeholder: "",
                            keyboardType: .numberPad,
                            maxLength: 1,
                            isNumberOnly: true
                        )
                        .frame(width: 48)
                        
                        // ****** 표시
                        Text("⦁⦁⦁⦁⦁⦁")
                            .font(.title2)
                            .foregroundColor(.appWhite)
                            .padding(.leading, 8)
                    }
                }
            }
            
            Spacer()
            
            // 다음 버튼
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
            .padding(.bottom, 40)
        }
        .frame(maxWidth: UIScreen.main.bounds.width * 0.98)
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                CustomBackButton(action: {
                    presentationMode.wrappedValue.dismiss()
                })
            }
        }
    }
}

struct PersonalInfoView_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = RegistrationViewModel()
        PersonalInfoView(viewModel: viewModel)
    }
}
