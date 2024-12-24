//
//  GridButton.swift
//  repf
//
//  Created by oobin on 12/17/24.
//

import SwiftUI

struct GridButton: View {
    let iconName: String           // 기본 아이콘 이미지 이름
    let selectedIconName: String   // 선택된 상태의 아이콘 이미지 이름
    let title: String
    let isSelected: Bool           // 기존 선택 상태
    let isSelectable: Bool         // 선택 효과 활성화 여부
    let action: () -> Void         // 버튼 액션
    
    var body: some View {
        Button(action: {
            action()
        }) {
            VStack(spacing: 16) {
                // 아이콘 (선택 여부에 따라 변경)
                Image(isSelectable && isSelected ? selectedIconName : iconName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 32, height: 32)
                    .foregroundColor(.icon)
                
                Text(title)
                    .font(.system(size: 16, weight: .medium))
                    .foregroundColor(.appWhite)
            }
            .frame(width: 172, height: 172)
            .background(isSelectable && isSelected ? Color.gridButtonSelected : Color.textBlack)
            .overlay(
                RoundedRectangle(cornerRadius: 12)
                    .stroke(isSelectable && isSelected ? Color.Primary : Color.clear, lineWidth: 2)
            )
            .cornerRadius(12)
        }
    }
}
