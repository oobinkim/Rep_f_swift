//
//  NickNameView.swift
//  repf
//
//  Created by oobin on 12/18/24.
//

import SwiftUI

struct NickNameView: View {
    @ObservedObject var viewModel: ProfileViewModel
    @FocusState private var focusedField: Field?
    @State private var selectedUserType: String? = nil
    @State private var navigateToMain = false
    
    enum Field {
        case head
        case middle
        case foot
    }
    
    var body: some View {
        NavigationStack {
            VStack {
                // 타이틀
                VStack(spacing: 8) {
                    Text("뭐라고 불러드릴까요?")
                        .font(.custom("Pretendard-Medium", size: 24))
                        .fontWeight(.semibold)
                        .foregroundColor(.appWhite)
                        .frame(maxWidth: .infinity,alignment: .leading)
                        .padding(.top, 32)
                        .padding(.bottom, 32)
                }
                .padding(.bottom, 16)
                
                OutLinedTextField(
                    text: $viewModel.profile.nickName,
                    placeholder: viewModel.profile.userType == "개인사육자" ? "닉네임 입력" : "업체명 또는 브리더명",
                    keyboardType: .default,
                    maxLength: 15,
                    isNumberOnly: false
                )
                .onSubmit {
                    if !viewModel.profile.nickName.isEmpty {
                        viewModel.goToNextStep()
                    }
                }
                
                Spacer()
                
                PrimaryButton(
                    title: "다음",
                    isEnabled: !viewModel.profile.nickName.isEmpty,
                    action: {
                        viewModel.goToNextStep()
                    },
                    enabledColor: .Primary,
                    disabledColor: .primaryDisabled,
                    textColor: .textBlack
                )
                .padding(.bottom, 40)
            }
            .navigationBarBackButtonHidden(true)
            .navigationDestination(isPresented: $navigateToMain) {
                MainView()
            }
            .frame(maxWidth: UIScreen.main.bounds.width * 0.98)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button(action: {
                        navigateToMain = true
                    }) {
                        Text("건너뛰기")
                            .foregroundColor(.placeHolder)
                    }
                }
                ToolbarItem(placement: .navigationBarLeading) {
                    CustomBackButton(action: {
                        viewModel.goToPreviousStep()
                    })
                }
            }
        }
    }
}

struct NickNameView_Previews: PreviewProvider {
    static var previews: some View {
        NickNameView(viewModel: ProfileViewModel())
    }
}
