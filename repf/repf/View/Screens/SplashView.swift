//
//  SplashView.swift
//  repf
//
//  Created by oobin on 12/11/24.
//

import SwiftUI

struct SplashView: View {
    @StateObject private var viewModel = SplashViewModel()
    @State private var navigateToAgreement = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color.bgBlack
                    .ignoresSafeArea()
                
                VStack {
                    HStack {
                        Spacer()
                        Image("TailTop")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 252.29, height: 136.96)
                            .offset(x: 45, y: 95)
                    }
                    .padding(.trailing, 10)
                    .padding(.top, 10)
                    
                    Spacer()
                    
                    Image("logo")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 193, height: 115)
                    
                    Spacer()
                    
                    HStack {
                        Image("TailBottom")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 197, height: 158)
                            .offset(x: -20, y: -100)
                        Spacer()
                    }
                    .padding(.leading, 10)
                    .padding(.bottom, 10)
                }
                
                VStack {
                    Spacer()
                    
                    VStack(spacing: 16) {
                        PrimaryButton(
                            title: "시작하기",
                            isEnabled: viewModel.isButtonEnabled,
                            action: {
                                navigateToAgreement = true
                            },
                            textColor: .textBlack
                        )
                        .opacity(viewModel.showButtons ? 1 : 0)
                        .padding(.horizontal)
                        
                        PrimaryButton(
                            title: "구글로 시작하기",
                            isEnabled: true,
                            action: {
                                print("구글로 시작하기 버튼 클릭됨!")
                            },
                            enabledColor: Color.appWhite,
                            textColor: .textBlack
                        )
                        .opacity(viewModel.showButtons ? 1 : 0)
                        .padding(.horizontal)
                    }
                    .padding(.bottom, 20)
                }
            }
            .navigationDestination(isPresented: $navigateToAgreement) {
                AgreementView()
            }
            .navigationDestination(isPresented: $viewModel.navigateToMain) {
                MainView() 
            }
            .onAppear {
                viewModel.handleAutoLogin()
            }
        }
    }
}


struct SplashView_Previews: PreviewProvider {
    static var previews: some View {
        SplashView()
    }
}
