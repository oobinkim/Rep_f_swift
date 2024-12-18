//
//  ComplitionView.swift
//  repf
//
//  Created by oobin on 12/14/24.
//

import SwiftUI

struct ComplitionView: View {
    
    @ObservedObject var viewModel: RegistrationViewModel

    @State private var navigateToProfile = false
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 32) {
                Spacer()
                Text("🎉")
                    .font(.custom("Pretendard-Medium", size: 64))
                    .fontWeight(.semibold)
                    .frame(maxWidth: .infinity, alignment: .center)
                Text("인증에 성공했어요!")
                    .font(.custom("Pretendard-Medium", size: 32))
                    .fontWeight(.semibold)
                    .frame(maxWidth: .infinity, alignment: .center)
                Text("함께하기 전에 몇 가지만 알려주시면\n서비스 이용에 도움드릴 수 있어요")
                    .multilineTextAlignment(.center)
                
                PrimaryButton(
                    title: "1분만에 프로필 설정하기",
                    isEnabled: true,
                    action: {
                        //navigateToProfile = true
                        viewModel.SaveUserInfo{ success in
                            if success {
                                print("인증 성공")
                                navigateToProfile = true
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
        }
        .frame(maxWidth: UIScreen.main.bounds.width * 0.98)
        .navigationBarBackButtonHidden(true)
        .navigationDestination(isPresented: $navigateToProfile) {
            ProfileView()
        }
    }
}

struct ComplitionView_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = RegistrationViewModel()
        ComplitionView(viewModel: viewModel)
    }
}
