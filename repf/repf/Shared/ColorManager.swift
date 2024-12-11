//
//  ColorManager.swift
//  repf
//
//  Created by oobin on 12/10/24.
//

import SwiftUI

struct ColorManager {
    static let lightGray = Color(hex: "#383838")
    static let darkGray = Color(hex: "#1E1E1E")
    
    static let purposeButtonGrey = Color(hex: "#2C2C2C")
    static let textGray = Color(hex: "#5A5A5A")
    static let borderGray = Color(hex: "#444444")
    static let hintGray = Color(hex: "#787878")
    
    static let darkGreen = Color(hex: "#234525")
    static let lightGreen = Color(hex: "#56F661")
    
    static let black = Color(hex: "#121212")
    static let white = Color(hex: "#F7F7F7")
}

// Default: 잘못된 헥사값일 경우 투명색으로 지정됨.
extension Color {
    init(hex: String) {
        let scanner = Scanner(string: hex)
        _ = scanner.scanString("#")
        
        var hexNumber: UInt64 = 0
        if scanner.scanHexInt64(&hexNumber) {
            let r = Double((hexNumber & 0xFF0000) >> 16) / 255
            let g = Double((hexNumber & 0x00FF00) >> 8) / 255
            let b = Double(hexNumber & 0x0000FF) / 255
            self.init(red: r, green: g, blue: b)
        } else {
            self.init(.clear)
        }
    }
}
