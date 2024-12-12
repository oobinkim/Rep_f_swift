//
//  SplashView.swift
//  repf
//
//  Created by oobin on 12/11/24.
//

import SwiftUI

struct SplashView: View {
    @State private var navigateToAgreement = false
    @State private var showButtons = false
    @State private var isButtonEnabled = false
    var body: some View {
        NavigationStack {
            ZStack {
                Color.appBlack
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
                            isEnabled: isButtonEnabled,
                            action: {
                                navigateToAgreement = true 
                            }
                        )
                        .padding(.horizontal, 16)
                        .opacity(showButtons ? 1 : 0)
                        
                        PrimaryButton(
                            title: "구글로 시작하기",
                            isEnabled: true,
                            action: {
                                print("구글로 시작하기 버튼 클릭됨!")
                            },
                            enabledColor: Color.white
                        )
                        .padding(.horizontal, 16)
                        .opacity(showButtons ? 1 : 0)
                    }
                    .padding(.bottom, 20)
                }
            }
            .navigationDestination(isPresented: $navigateToAgreement) {
                AgreementView()
            }
            .onAppear {
                // 2초 후 버튼 활성화
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    isButtonEnabled = true
                    withAnimation(.easeIn(duration: 0.5)) {
                        showButtons = true
                    }
                }
            }
        }
    }
}


struct SplashView_Previews: PreviewProvider {
    static var previews: some View {
        SplashView()
    }
}
