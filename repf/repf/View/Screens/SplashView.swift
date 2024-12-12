import SwiftUI

struct SplashView: View {
    @State private var isButtonEnabled = true
    @State private var showButtons = false // 버튼 표시 여부
    
    var body: some View {
        GeometryReader { geometry in
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
                
                Spacer()
                
                VStack {
                    Spacer()
                    
                    VStack(spacing: 16) {
                        PrimaryButton(
                            title: "시작하기",
                            isEnabled: isButtonEnabled,
                            action: {
                                print("시작하기 버튼 클릭됨!")
                            }
                        )
                        .padding(.horizontal, 16)
                        .opacity(showButtons ? 1 : 0) // 페이드 인 효과
                        
                        PrimaryButton(
                            title: "구글로 시작하기",
                            isEnabled: isButtonEnabled,
                            action: {
                                print("구글로 시작하기 버튼 클릭됨!")
                            },
                            enabledColor: Color.white
                        )
                        .padding(.horizontal, 16)
                        .opacity(showButtons ? 1 : 0) // 페이드 인 효과
                    }
                    .padding(.bottom, geometry.safeAreaInsets.bottom + 20)
                }
            }
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
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
