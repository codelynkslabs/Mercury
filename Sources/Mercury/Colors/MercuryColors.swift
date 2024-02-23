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

  public enum Base {
    public static let xfdb426 = MercuryColor(hexValue: 0xfdb426)
    public static let xffffff = MercuryColor(hexValue: 0xffffff)
    public static let xfcfcfc = MercuryColor(hexValue: 0xfcfcfc)
    public static let x25292d = MercuryColor(hexValue: 0x25292d)
  }
}

// MARK: - Implementation Details

internal extension UIColor {
    convenience init(red: Int, green: Int, blue: Int) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")

        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0,
                  blue: CGFloat(blue) / 255.0, alpha: 1.0)
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
