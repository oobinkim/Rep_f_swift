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
            ProgressView(value: viewModel.progress)
                .progressViewStyle(LinearProgressViewStyle(tint: .Primary))
                          .frame(height: 4)
                          .padding(.top, 68)
                          .frame(maxWidth: UIScreen.main.bounds.width * 0.98)
                      Spacer().frame(height: 4)
               
            if viewModel.currentStep == 1 {
                UserTypeView(viewModel: viewModel)
            }
            Spacer()
        }
        .padding()
        .background(Color.bgBlack.edgesIgnoringSafeArea(.all))
        .foregroundColor(.white)
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Button(action: {
                   //TODO: skip 추가
                }) {
                    Text("건너뛰기")
                        .foregroundColor(.placeHolder)
                }
            }
        }
    }
}


struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
