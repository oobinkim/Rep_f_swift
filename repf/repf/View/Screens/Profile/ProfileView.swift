//
//  ProfileView.swift
//  repf
//
//  Created by oobin on 12/17/24.
//
import SwiftUI

struct ProfileView: View {
    @StateObject private var viewModel = ProfileViewModel()
    
    var body: some View {
        VStack() {
            if viewModel.currentStep < viewModel.totalSteps {
                ProgressView(value: viewModel.progress)
                    .progressViewStyle(LinearProgressViewStyle(tint: .Primary))
                    .frame(height: 4)
                    .padding(.top, 68)
                    .frame(maxWidth: UIScreen.main.bounds.width * 0.98)
                Spacer().frame(height: 4)
            }
               
            if viewModel.currentStep == 1 {
                UserTypeView(viewModel: viewModel)
            }else if viewModel.currentStep == 2 {
                if viewModel.profile.userType == "업체/브리더"{
                    BusinessNumberView(viewModel: viewModel)
                }else{
                    NickNameView(viewModel: viewModel)
                }
            }else if viewModel.currentStep == 3 {
                if viewModel.profile.userType == "업체/브리더"{
                    NickNameView(viewModel: viewModel)
                }else{
                    ProfileComplitionView(viewModel: viewModel)
                }
            }else if viewModel.currentStep == 4 {
                if viewModel.profile.userType == "업체/브리더"{
                    MainSpeciesView(viewModel: viewModel)
                }
            }else if viewModel.currentStep == 5 {
                if viewModel.profile.userType == "업체/브리더"{
                    ProfileComplitionView(viewModel: viewModel)
                }
            }
            Spacer()
        }
        .padding()
        .background(Color.bgBlack.edgesIgnoringSafeArea(.all))
        .foregroundColor(.white)
    }
}


struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
