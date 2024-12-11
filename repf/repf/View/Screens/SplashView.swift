import SwiftUI

struct SplashView: View {
    @State private var isButtonEnabled = true // 버튼 활성화 상태
    
    var body: some View {
        GeometryReader { geometry in
            ZStack {
                // 배경 이미지
                Image("SplashBackgraound")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .ignoresSafeArea()
                
                VStack {
                    Spacer() // 상단 여백
                    
                    VStack(spacing: 16) { // 버튼 그룹
                        // 첫 번째 버튼
                        PrimaryButton(
                            title: "시작하기",
                            isEnabled: isButtonEnabled,
                            action: {
                                print("시작하기 버튼 클릭됨!")
                            }
                        )
                        .padding(.horizontal, 16)
                        
                        // 두 번째 버튼
                        PrimaryButton(
                            title: "구글로 시작하기",
                            isEnabled: isButtonEnabled,
                            action: {
                                print("구글로 시작하기 버튼 클릭됨!")
                            },
                            enabledColor: Color.white
                        )
                        .padding(.horizontal, 16)
                    }
                    .padding(.bottom, geometry.safeAreaInsets.bottom + 80) // 하단 여백
                }
            }
        }
    }
}

struct SplashView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            SplashView()
                .previewDevice("iPhone 14")
            
            SplashView()
                .previewDevice("iPad Pro (12.9-inch) (6th generation)") // iPad 미리보기
        }
    }
}
