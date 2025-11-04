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
    static let pastelBlue = Color(red: 0.7, green: 0.85, blue: 1.0)
    static let pastelPink = Color(red: 1.0, green: 0.8, blue: 0.85)
    static let pastelGreen = Color(red: 0.8, green: 1.0, blue: 0.8)
    static let pastelYellow = Color(red: 1.0, green: 1.0, blue: 0.7)
}

struct AppColors {
    static let primary = Color(hex: 0x5F33E1)
    static let secondary = Color(hex: 0x6E6A7C)
    static let black = Color(hex: 0x24252C)
}
