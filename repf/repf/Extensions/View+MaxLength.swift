//
//  View+MaxLength.swift
//  repf
//
//  Created by oobin on 12/15/24.
//

import SwiftUI

extension View {
    func maxLength(_ text: Binding<String>, maxLength: Int) -> some View {
        self.modifier(MaxLengthModifier(text: text, maxLength: maxLength))
    }
}
