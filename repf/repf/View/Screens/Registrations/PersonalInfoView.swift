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
            VStack(spacing: 8) {
                Text("본인 확인이 필요해요")
                    .font(.custom("Pretendard-Medium", size: 24))
                    .fontWeight(.semibold)
                    .foregroundColor(.appWhite)
                    .padding(.horizontal, 32)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            .padding(.top, 68)
            .padding(.bottom, 28)
            
            // 입력 필드
            VStack(spacing: 32) {
                VStack(alignment: .leading, spacing: 10) {
                    Text("이름")
                        .font(.custom("Pretendard-Medium", size: 16))
                        .foregroundColor(.appWhite)
                    
                    TextField("이름", text: $viewModel.user.name)
                        .padding()
                        .background(Color.textBlack)
                        .cornerRadius(12)
                        .foregroundColor(.white)
                        .frame(maxWidth: UIScreen.main.bounds.width * 0.9, maxHeight: UIScreen.main.bounds.height * 0.06)
                        .overlay(
                            RoundedRectangle(cornerRadius: 12)
                                .stroke(isFocused ? Color.Primary : Color.textBoxBorder, lineWidth: 1)
                        )
                        .accentColor(.Primary)
                        .focused($isFocused)
                }
                
                VStack(alignment: .leading, spacing: 8) {
                    Text("주민등록번호")
                        .font(.custom("Pretendard-Medium", size: 16))
                        .foregroundColor(.appWhite)
                    
                    HStack(spacing: 8) {
                        TextField("생년월일 앞 6자리", text: $viewModel.user.idNumber)
                            .keyboardType(.numberPad)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .foregroundColor(.black)
                            .frame(maxWidth: UIScreen.main.bounds.width * 0.7)
                        
                        Text("-")
                            .font(.title)
                            .foregroundColor(.appWhite)
                            .frame(maxWidth: UIScreen.main.bounds.width * 0.05)
                        
                        SecureField("뒷자리", text: $viewModel.user.idNumber)
                            .keyboardType(.numberPad)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                            .foregroundColor(.black)
                            .frame(maxWidth: UIScreen.main.bounds.width * 0.05)
                        
                        Text("⦁ ⦁ ⦁ ⦁ ⦁ ⦁")
                            .font(.title)
                            .foregroundColor(.appWhite)
                            .frame(maxWidth: .infinity, alignment: .trailing)
                    }
                }
            }
            .frame(maxWidth: UIScreen.main.bounds.width * 0.9)
            .padding(.horizontal)
            
            Spacer()
            
            PrimaryButton(
                title: "다음",
                isEnabled: isInputedText,
                action: {
                    print("다음 화면으로 이동")
                },
                enabledColor: .Primary,
                disabledColor: .primaryDisabled,
                textColor: .textBlack
            )
            .padding(.bottom, 40)
        }
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
