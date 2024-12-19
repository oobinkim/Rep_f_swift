//
//  UserTypeView.swift
//  repf
//
//  Created by oobin on 12/17/24.
//

import SwiftUI

struct UserTypeView: View {
    @ObservedObject var viewModel: ProfileViewModel
    @State private var selectedUserType: String? = nil
    @State private var navigateToMain = false
    var body: some View {
        NavigationStack {
            VStack {
                // 타이틀
                VStack(spacing: 8) {
                    Text("당신은 누구신가요?")
                        .font(.custom("Pretendard-Medium", size: 24))
                        .fontWeight(.semibold)
                        .foregroundColor(.appWhite)
                        .frame(maxWidth: .infinity,alignment: .leading)
                        .padding(.top, 32)
                        .padding(.bottom, 32)
                }
                
                HStack(spacing: 18) {
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
                    isEnabled: selectedUserType != nil,
                    action: {
                        if let userType = selectedUserType {
                            if userType == "개인사육자" {
                                viewModel.totalSteps = 3
                            } else {
                                viewModel.totalSteps = 5
                            }
                            
                            viewModel.goToNextStep()
                        }
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
            }
        }
    }
}

struct UserTypeView_Previews: PreviewProvider {
    static var previews: some View {
        UserTypeView(viewModel: ProfileViewModel())
    }
}
