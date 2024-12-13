//
//  PrimaryButton.swift
//  repf
//
//  Created by oobin on 12/11/24.
//

import SwiftUI

/// PrimaryButton 컴포넌트
struct PrimaryButton: View {
    let title: String               // 버튼 텍스트
    let isEnabled: Bool             // 활성화 상태
    let action: () -> Void          // 버튼 클릭 액션

    // 색상 주입을 위한 속성
    let enabledColor: Color         // 활성화 상태의 배경색
    let disabledColor: Color        // 비활성화 상태의 배경색
    let textColor: Color            // 텍스트 색상

    init(
        title: String,
        isEnabled: Bool,
        action: @escaping () -> Void,
        enabledColor: Color = Color.Primary,            // 기본 활성화 색상
        disabledColor: Color = Color.PrimaryDisabled,   // 기본 비활성화 색상
        textColor: Color = .black                       // 기본 텍스트 색상
    ) {
        self.title = title
        self.isEnabled = isEnabled
        self.action = action
        self.enabledColor = enabledColor
        self.disabledColor = disabledColor
        self.textColor = textColor
    }

    var body: some View {
        Button(action: {
            if isEnabled {
                action()
            }
        }) {
            Text(title)
                .font(.custom("Pretendard-Medium", size: 18))
                .foregroundColor(textColor)
                .frame(maxWidth: .infinity)
                .padding()
                .background(isEnabled ? enabledColor : disabledColor)
                .cornerRadius(12)
        }
        .disabled(!isEnabled)
        .padding(.horizontal, 4)
    }
}
