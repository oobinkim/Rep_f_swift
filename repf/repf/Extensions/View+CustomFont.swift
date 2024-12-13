//
//  View+CustomFont.swift
//  repf
//
//  Created by oobin on 12/13/24.
//
import SwiftUI

extension View {
    func customFont(_ fontName: String) -> some View {
        self.environment(\.font, Font.custom(fontName, size: 16))
    }
}
