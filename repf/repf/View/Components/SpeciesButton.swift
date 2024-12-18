//
//  SpeciesButton.swift
//  repf
//
//  Created by oobin on 12/18/24.
//

import SwiftUI

struct SpeciesButton: View {
    let title: String
    let isSelected: Bool
    let action: () -> Void

    var body: some View {
        Button(action: {
            action()
        }) {
            Text(title)
                .foregroundColor(isSelected ? .bgBlack : .appWhite)
                .fontWeight(.medium)
                .lineLimit(1)
                .minimumScaleFactor(0.5)
                .padding(.horizontal, 12)
                .padding(.vertical, 8)
                .background(isSelected ? Color.appWhite : Color.speciesButton)
                .cornerRadius(8)
        }
    }
}
