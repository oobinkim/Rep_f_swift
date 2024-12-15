//
//  SegmentStyleButton.swift
//  repf
//
//  Created by oobin on 12/15/24.
//

import SwiftUI

struct SegmentStyleButton: View {
    let title: String
    let isSelected: Bool
    let position: ButtonPosition // 버튼 위치
    let action: () -> Void

    enum ButtonPosition {
        case first, middle, last
    }

    var body: some View {
        Button(action: action) {
            Text(title)
                .font(.system(size: 16, weight: .medium))
                .frame(maxWidth: .infinity, minHeight: 48)
                .foregroundColor(isSelected ? .appWhite : .placeHolder)
                .background(isSelected ? Color.textBoxBorder : Color.textBlack)
        }
        .clipShape(RoundedRectangleShape(position: position, radius: 8))
        .overlay(
            RoundedRectangleShape(position: position, radius: 8)
                .stroke(Color.textBoxBorder, lineWidth: 1)
        )
    }
}

struct RoundedRectangleShape: Shape {
    let position: SegmentStyleButton.ButtonPosition
    let radius: CGFloat

    func path(in rect: CGRect) -> Path {
        var path = Path()
        let corners: UIRectCorner

        switch position {
        case .first:
            corners = [.topLeft, .bottomLeft]
        case .last:
            corners = [.topRight, .bottomRight]
        case .middle:
            corners = []
        }

        let bezierPath = UIBezierPath(
            roundedRect: rect,
            byRoundingCorners: corners,
            cornerRadii: CGSize(width: radius, height: radius)
        )
        path.addPath(Path(bezierPath.cgPath))
        return path
    }
}
