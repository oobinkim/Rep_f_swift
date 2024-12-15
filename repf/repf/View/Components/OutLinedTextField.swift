//
//  OutLinedTextField.swift
//  repf
//
//  Created by oobin on 12/15/24.
//

import SwiftUI

struct OutLinedTextField: View {
    @Binding var text: String
    let placeholder: String
    let keyboardType: UIKeyboardType
    let maxLength: Int?
    let isNumberOnly: Bool
    
    @FocusState private var isFocused: Bool
    
    var body: some View {
        ZStack(alignment: .leading) {
            
            if text.isEmpty {
                Text(placeholder)
                    .foregroundColor(Color.placeHolder)
                    .padding(.horizontal, 2)
            }
            
            TextField("", text: $text)
                .keyboardType(keyboardType)
                .onChange(of: text) { newValue in
                    handleInputChange(newValue)
                }
                .focused($isFocused)
                .padding(.horizontal, 2)
        }
        .padding()
        .background(Color.textBlack)
        .cornerRadius(8)
        .foregroundColor(.appWhite)
        .overlay(
            RoundedRectangle(cornerRadius: 8)
                .stroke(isFocused ? Color.Primary : Color.textBoxBorder, lineWidth: 1)
        )
        .accentColor(.Primary)
    }
    
    private func handleInputChange(_ newValue: String) {
        var filteredText = newValue
        
        if isNumberOnly {
            filteredText = filteredText.filter { $0.isNumber }
        }
        
        if let maxLength = maxLength {
            filteredText = String(filteredText.prefix(maxLength))
        }
        
        text = filteredText
    }
}
