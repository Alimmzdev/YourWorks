//
//  Colors.swift
//  YourWorks
//
//  Created by Alimmz on 10/31/25.
//

import SwiftUI

extension Color {
    init(hex: Int, opacity: Double = 1.0) {
        let red = Double((hex & 0xff0000) >> 16) / 255.0
        let green = Double((hex & 0xff00) >> 8) / 255.0
        let blue = Double((hex & 0xff) >> 0) / 255.0
        self.init(.sRGB, red: red, green: green, blue: blue, opacity: opacity)
    }
}

struct AppColors {
    static let primary = Color(hex: 0x5F33E1)
    static let secondary = Color(hex: 0x6E6A7C)
    static let black = Color(hex: 0x24252C)
}
