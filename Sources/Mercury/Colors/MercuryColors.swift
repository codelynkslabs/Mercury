//
//  File.swift
//  
//
//  Created by Satheesh on 22/02/24.
// Courtesy: https://github.com/Decathlon/vitamin-ios 

import SwiftUI
import Foundation
import UIKit.UIColor

// MARK: - Colors

public struct MercuryColor {
    public let hexValue: Int
    public var color: UIColor { return UIColor(named: self) }
    
    //Button
    public static let primaryBackground = MercuryColor(hexValue: 0x355070)
    public static let primaryForeground = MercuryColor(hexValue: 0xE56B6F)
    public static let secondaryBackground = MercuryColor(hexValue: 0xB56576)
    public static let secondaryForeground = MercuryColor(hexValue: 0x6D597A)
    
    //Slider
    public static let rectangle1 = MercuryColor(hexValue: 0x25292D)
    public static let rectangle2 = MercuryColor(hexValue: 0x0496FF)
}

// MARK: - Implementation Details

internal extension UIColor {
    convenience init(red: Int, green: Int, blue: Int) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")
        
        self.init(red: CGFloat(red) / 255.0,
                  green: CGFloat(green) / 255.0,
                  blue: CGFloat(blue) / 255.0,
                  alpha: 1.0)
    }

    convenience init(hexValue: Int) {
        self.init(
            red: (hexValue >> 16) & 0xFF,
            green: (hexValue >> 8) & 0xFF,
            blue: hexValue & 0xFF
        )
    }
}

public extension UIColor {
    convenience init(named color: MercuryColor) {
        self.init(hexValue: color.hexValue)
    }
}

extension MercuryColor {
    public var swiftUIColor: Color {
        Color(uiColor: color)
    }
}
