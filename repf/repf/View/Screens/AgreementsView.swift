//
//  AgreementsView.swift
//  repf
//
//  Created by oobin on 12/12/24.
//

import SwiftUI

struct AgreementView: View {
    // State variables for checkboxes
    @State private var isAllAgreed = false
    @State private var isTermsAgreed = false
    @State private var isPrivacyAgreed = false
    @State private var navigateToRegistration = false
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                // Title
                VStack(spacing: 8) {
                    Text("서비스 이용을 위해\n이용약관 동의가 필요합니다.")
                        .font(.custom("Pretendard-Medium", size: 24))
                        .fontWeight(.semibold)
                        .foregroundColor(.appWhite)
                        .fixedSize(horizontal: false, vertical: true)
                        .padding(.horizontal, 32)
                        .frame(maxWidth: .infinity, alignment: .leading)
                }
                .padding(.top, 68)
                .padding(.bottom, 28)
                PrimaryButton(
                    title: "모두 동의합니다.",
                    isEnabled: true,
                    action: {
                        isAllAgreed.toggle()
                        isTermsAgreed = isAllAgreed
                        isPrivacyAgreed = isAllAgreed
                    },
                    enabledColor: isAllAgreed ? .ableGray : .textBlack,
                    textColor: .white
                )
                .padding(.bottom, 16)
                .padding(.horizontal)
                // 체크박스 섹션
                VStack(alignment: .leading, spacing: 16) {
                    AgreementCheckbox(
                        isChecked: $isTermsAgreed,
                        title: "서비스 이용 약관 (필수)",
                        content: "본 이용약관(이하 “이용약관”)은 랩프 앱 및 관련하여 제공하는 프로그램, 소프트웨어 등(이하 “서비스” 또는 “랩프”) 및 본 이용약관의 적용을 받으며 랩프 앱에서 업로드 및 다운로드, 공유되는 모든 정보 및 텍스트, 그래픽, 사진, 기타 자료(이하 통칭 “콘텐츠”)에 대한 접근 및 이용에 관한 사항을 규정합니다. 본 이용약관에 동의하지 않는 경우 랩프를 이용할 수 없습니다."
                    )
                    
                    AgreementCheckbox(
                        isChecked: $isPrivacyAgreed,
                        title: "개인정보 처리방침 (필수)",
                        content: "수집하는 개인정보 이용자는 회원가입을 하지 않아도 랩프 서비스를 회원과 동일하게 이용할 수 있습니다. 이용자가 피드, 채팅 등과 같이 개인화 혹은 회원제 서비스를 이용하기 위해 회원가입을 할 경우, 랩프는 서비스 이용을 위해 필요한 최소한의 개인정보를 수집합니다."
                    )
                }
                .padding(.horizontal, 32)
                
                Spacer()
                
                // "다음" 버튼
                PrimaryButton(
                    title: "다음",
                    isEnabled: isTermsAgreed && isPrivacyAgreed,
                    action: {
                        navigateToRegistration = true
                    },
                    enabledColor: .Primary,
                    disabledColor: .primaryDisabled,
                    textColor: .textBlack
                )
                .padding(.bottom, 40)
                .padding(.horizontal)
            }
            .background(Color.bgBlack.edgesIgnoringSafeArea(.all))
            .navigationBarBackButtonHidden(true)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    CustomBackButton(action: {
                        presentationMode.wrappedValue.dismiss()
                    })
                }
            }
        }
        .navigationDestination(isPresented: $navigateToRegistration) {
            RegistrationView()
        }
    }
}
    


struct AgreementView_Previews: PreviewProvider {
    static var previews: some View {
        AgreementView()
    }
}
