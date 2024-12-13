//
//  AgreementCheckBox.swift
//  repf
//
//  Created by oobin on 12/13/24.
//

import SwiftUI

struct AgreementCheckbox: View {
    @Binding var isChecked: Bool
    let title: String
    let content: String

    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            // 체크박스와 제목
            HStack {
                Button(action: {
                    isChecked.toggle()
                }) {
                    Image(systemName: isChecked ? "checkmark.square.fill" : "square")
                        .foregroundColor(isChecked ? .Primary : .checkBoxBorder)
                        .font(.custom("Pretendard-Medium", size: 18))
                }
                Text(title)
                    .font(.custom("Pretendard-Medium", size: 16))
                    .foregroundColor(.appWhite)
            }

            Text(content)
                .font(.custom("Pretendard-Medium", size: 14))
                .foregroundColor(.textBoxTextGray)
                .frame(maxWidth: UIScreen.main.bounds.width * 0.9)
                .padding(12)
                .lineSpacing(2)
                .background(
                    RoundedRectangle(cornerRadius: 8)
                        .stroke(Color.textBoxBorder, lineWidth: 1)
                )
        }
    }
}
