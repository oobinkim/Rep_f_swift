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
            // 타이틀
            VStack(spacing: 8) {
                Text("인증번호를 입력해주세요")
                    .font(.custom("Pretendard-Medium", size: 28))
                    .fontWeight(.semibold)
                    .foregroundColor(.appWhite)
                    .frame(maxWidth: .infinity, alignment: .leading)
            }
            .padding(.top, 52)
            .padding(.bottom, 28)
            
            VStack(alignment: .leading, spacing: 8) {
                ZStack(alignment: .leading) {
                    if viewModel.user.verificationCode.isEmpty {
                        Text("6자리 코드")
                            .foregroundColor(.placeHolder)
                            .padding(.leading)
                    }
                    
                    // 입력 필드
                    TextField("", text: $viewModel.user.verificationCode)
                        .keyboardType(.numberPad)
                        .foregroundColor(.appWhite)
                        .padding(.leading, 4)
                        .maxLength($viewModel.user.verificationCode, maxLength: 6)
                }
                
                // 밑줄
                Rectangle()
                    .frame(height: 2)
                    .foregroundColor(.green)
                
                // 에러 메시지
                if let errorMessage = viewModel.errorMessage {
                    Text(errorMessage)
                        .font(.system(size: 14))
                        .foregroundColor(.red)
                        .padding(.top, 4)
                        .padding(.leading, 4)
                }
            }
            .padding(.bottom, 64)

            // 다음 버튼
            PrimaryButton(
                title: "다음",
                isEnabled: viewModel.isInPutVerificationCode,
                action: {
                    viewModel.verifyCode(verificationCode: viewModel.user.verificationCode) { success in
                        if success {
                            print("인증 성공")
                            viewModel.goToNextStep() // 다음 단계로 이동
                        } else {
                            print("인증 실패: \(viewModel.errorMessage ?? "알 수 없는 오류")")
                        }
                    }
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

struct VerificationCodeView_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = RegistrationViewModel()
        VerificationCodeView(viewModel: viewModel)
    }
}
