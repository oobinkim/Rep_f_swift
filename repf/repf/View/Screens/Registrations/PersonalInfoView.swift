//
//  PersonalInfoView.swift
//  repf
//
//  Created by oobin on 12/14/24.
//

import SwiftUI

struct PersonalInfoView: View {
    
    @ObservedObject var viewModel: RegistrationViewModel
    @Environment(\.presentationMode) var presentationMode
    
    // FocusState 추가
    @FocusState private var focusedField: Field?
    
    enum Field {
        case name
        case birth
        case gender
    }
    
    var body: some View {
        VStack(spacing: 20) {
            // 상단 제목
            VStack(spacing: 8) {
                Text("본인 확인이 필요해요")
                    .font(.custom("Pretendard-Medium", size: 28))
                    .fontWeight(.semibold)
                    .foregroundColor(.appWhite)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            .padding(.top, 52)
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
                    .focused($focusedField, equals: .name)
                    .onSubmit {
                        focusedField = .birth
                    }
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
                            keyboardType: .numbersAndPunctuation,
                            maxLength: 6,
                            isNumberOnly: true
                        )
                        .focused($focusedField, equals: .birth)
                        .onSubmit {
                            focusedField = .gender
                        }
                        
                        // - 기호
                        Text("-")
                            .font(.title2)
                            .foregroundColor(.appWhite)
                            .frame(width: 10)
                        
                        // 성별 필드
                        OutLinedTextField(
                            text: $viewModel.user.gender,
                            placeholder: "",
                            keyboardType: .numbersAndPunctuation,
                            maxLength: 1,
                            isNumberOnly: true
                        )
                        .focused($focusedField, equals: .gender)
                        .onSubmit {
                            focusedField = nil
                            if viewModel.isInputValidInfo{
                                viewModel.goToNextStep()
                            }
                        }
                        .frame(width: 48)
                        
                        // ****** 표시
                        Text("⦁⦁⦁⦁⦁⦁")
                            .font(.title2)
                            .foregroundColor(.appWhite)
                            .padding(.leading, 8)
                    }
                }
            }
            .padding(.bottom, 64)
            
            // 다음 버튼
            PrimaryButton(
                title: "다음",
                isEnabled: viewModel.isInputValidInfo,
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
                    presentationMode.wrappedValue.dismiss()
                })
            }
        }
        .submitLabel(.next)
    }
}


struct PersonalInfoView_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = RegistrationViewModel()
        PersonalInfoView(viewModel: viewModel)
    }
}
