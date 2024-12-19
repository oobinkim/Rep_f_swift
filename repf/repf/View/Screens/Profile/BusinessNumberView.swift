//
//  BusinessNumberView.swift
//  repf
//
//  Created by oobin on 12/18/24.
//

import SwiftUI

struct BusinessNumberView: View {
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
                    Text("사업자 등록 번호를 알려주세요!")
                        .font(.custom("Pretendard-Medium", size: 24))
                        .fontWeight(.semibold)
                        .foregroundColor(.appWhite)
                        .frame(maxWidth: .infinity,alignment: .leading)
                        .padding(.top, 32)
                        .padding(.bottom, 32)
                }
                .padding(.bottom, 24)
                
                HStack(spacing: 8) {
                    OutLinedTextField(
                        text: $viewModel.bizRegHead,
                        placeholder: "",
                        keyboardType: .numbersAndPunctuation,
                        maxLength: 3,
                        isNumberOnly: true
                    )
                    .focused($focusedField, equals: .head)
                    .onSubmit {
                        focusedField = .middle
                    }
                    
                    Text("-")
                        .font(.title2)
                        .foregroundColor(.appWhite)
                        .frame(width: 10)
                    
                    OutLinedTextField(
                        text: $viewModel.bizRegMiddle,
                        placeholder: "",
                        keyboardType: .numbersAndPunctuation,
                        maxLength: 2,
                        isNumberOnly: true
                    )
                    .focused($focusedField, equals: .middle)
                    .onSubmit {
                        focusedField = .foot
                    }
                    
                    Text("-")
                        .font(.title2)
                        .foregroundColor(.appWhite)
                        .frame(width: 10)
                    
                    OutLinedTextField(
                        text: $viewModel.bizRegFoot,
                        placeholder: "",
                        keyboardType: .numbersAndPunctuation,
                        maxLength: 5,
                        isNumberOnly: true
                    )
                    .focused($focusedField, equals: .foot)
                    .onSubmit {
                        focusedField = .foot
                    }
                }
                
                Spacer()
                
                PrimaryButton(
                    title: "다음",
                    isEnabled: viewModel.isInputValid,
                    action: {
                        viewModel.goToNextStep()
                        print(viewModel.profile.businessNumber)
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

struct BusinessNumberView_Previews: PreviewProvider {
    static var previews: some View {
        BusinessNumberView(viewModel: ProfileViewModel())
    }
}
