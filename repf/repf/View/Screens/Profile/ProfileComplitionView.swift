//
//  ProfileComplitionView.swift
//  repf
//
//  Created by oobin on 12/19/24.
//

import SwiftUI

struct ProfileComplitionView: View {
    
    @ObservedObject var viewModel: ProfileViewModel
    @State private var navigateToMain = false
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 32) {
                Spacer()
                Text("👏")
                    .font(.custom("Pretendard-Medium", size: 64))
                    .fontWeight(.semibold)
                    .frame(maxWidth: .infinity, alignment: .center)
                Text(
                    viewModel.profile.userType == "개인사육자" ?
                    "‘\(viewModel.profile.nickName)’님, 환영합니다!" :
                        (viewModel.profile.mainSpecies == "none" ?
                         "‘\(viewModel.profile.nickName)’님은\n고민중인\n업체/브리더네요!" :
                            "‘\(viewModel.profile.nickName)’님은\n'\(viewModel.profile.mainSpecies)' 전문\n'업체/브리더’네요!"
                        )
                )
                .font(.custom("Pretendard-Medium", size: 28))
                .fontWeight(.semibold)
                .multilineTextAlignment(.center)
                .frame(maxWidth: .infinity, alignment: .center)
                Text("당신을 알려주셔서 감사해요.\n이제 랩프를 이용해볼까요!")
                    .multilineTextAlignment(.center)
                
                PrimaryButton(
                    title: "시작하기!",
                    isEnabled: true,
                    action: {
                        
                        viewModel.saveProfile { success in
                            if success {
                                navigateToMain = true
                            } else {
                                print("프로필 저장 실패")
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
        .navigationDestination(isPresented: $navigateToMain) {
            MainView()
        }
    }
}

struct ProfileComplitionView_Previews: PreviewProvider {
    static var previews: some View {
        let viewModel = ProfileViewModel()
        ProfileComplitionView(viewModel: viewModel)
    }
}
