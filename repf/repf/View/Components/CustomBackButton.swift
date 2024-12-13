//
//  CustomBackButton.swift
//  repf
//
//  Created by oobin on 12/13/24.
//

import SwiftUI

struct CustomBackButton: View {
    let action: () -> Void

    var body: some View {
        Button(action: {
            action()
        }) {
            Image(systemName: "arrow.left")
                .font(.custom("Pretendard-Medium", size: 18))
                .foregroundColor(.appWhite)
        }
    }
}
