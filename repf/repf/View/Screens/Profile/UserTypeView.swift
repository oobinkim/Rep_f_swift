//
//  UserTypeView.swift
//  repf
//
//  Created by oobin on 12/17/24.
//

import SwiftUI

struct UserTypeView: View {
    @ObservedObject var viewModel: ProfileViewModel
    
    // 선택된 타입 상태
    @State private var selectedUserType: String? = nil

    var body: some View {
        VStack {
            // 타이틀
            VStack(spacing: 8) {
                Text("당신은 누구신가요?")
                    .font(.custom("Pretendard-Medium", size: 28))
                    .fontWeight(.semibold)
                    .foregroundColor(.appWhite)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.top, 32)
                    .padding(.bottom, 32)
            }
            
            // 선택 버튼 2개
            HStack(spacing: 32) {
                GridButton(
                    iconName: "Apartment",
                    selectedIconName: "Apartment_Selected",
                    title: "업체/브리더",
                    isSelected: selectedUserType == "업체/브리더"
                ) {
                    selectedUserType = "업체/브리더"
                    viewModel.profile.userType = selectedUserType!
                }

                GridButton(
                    iconName: "Person",
                    selectedIconName: "Person_Selected",
                    title: "개인사육자",
                    isSelected: selectedUserType == "개인사육자"
                ) {
                    selectedUserType = "개인사육자"
                    viewModel.profile.userType = selectedUserType!
                }
            }
            .padding(.bottom, 40)

            Spacer()

            // 다음 버튼
            PrimaryButton(
                title: "다음",
                isEnabled: selectedUserType != nil, // 선택 상태에 따라 활성화
                action: {
                    if let userType = selectedUserType {
                        print("\(userType) 선택됨")
                        viewModel.goToNextStep()
                    }
                },
                enabledColor: .Primary,
                disabledColor: .primaryDisabled,
                textColor: .textBlack
            )
            .padding(.bottom, 40)
            .padding(.horizontal)
        }
        .padding()
        .navigationBarBackButtonHidden(true)
        .frame(maxWidth: UIScreen.main.bounds.width * 0.98)
    }
}

struct UserTypeView_Previews: PreviewProvider {
    static var previews: some View {
        UserTypeView(viewModel: ProfileViewModel())
    }
}
