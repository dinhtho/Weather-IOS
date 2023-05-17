//
//  LightThem.swift
//  WeatherApp
//
//  Created by LAP15789 on 15/05/2023.
//

import Foundation
import SwiftUI

final class LightTheme:Theme{
    var screenColor: Color = .white

    var backgroundColor: Color = Color(0x5D3FD3 )
    
    var textColor: Color = Color(0xFFFFFF)
    
    var statusColor: Color = Color(0x059142)
    
}

extension Color {
    init(_ hex: UInt32, opacity:Double = 1.0) {
        let red = Double((hex & 0xff0000) >> 16) / 255.0
        let green = Double((hex & 0xff00) >> 8) / 255.0
        let blue = Double((hex & 0xff) >> 0) / 255.0
        self.init(.sRGB, red: red, green: green, blue: blue, opacity: opacity)
    }
}
