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
  public let rgbaValue: UInt32
  public var color: UIColor { return UIColor(named: self) }

  public enum Base {
    public static let xfdb426 = MercuryColor(rgbaValue: 0xfdb426)
    public static let xffffff = MercuryColor(rgbaValue: 0xffffff)
    public static let xfcfcfc = MercuryColor(rgbaValue: 0xfcfcfc)
    public static let x25292d = MercuryColor(rgbaValue: 0x25292d)
  }
}

// MARK: - Implementation Details

internal extension UIColor {
  convenience init(rgbaValue: UInt32) {
    let components = RGBAComponents(rgbaValue: rgbaValue).normalized
    self.init(red: components[0], green: components[1], blue: components[2], alpha: components[3])
  }
}

private struct RGBAComponents {
  let rgbaValue: UInt32

  private var shifts: [UInt32] {
    [
      rgbaValue >> 24, // red
      rgbaValue >> 16, // green
      rgbaValue >> 8,  // blue
      rgbaValue        // alpha
    ]
  }

  private var components: [CGFloat] {
    shifts.map {
      CGFloat($0 & 0xff)
    }
  }

  var normalized: [CGFloat] {
    components.map { $0 / 255.0 }
  }
}

public extension UIColor {
  convenience init(named color: MercuryColor) {
    self.init(rgbaValue: color.rgbaValue)
  }
}

extension MercuryColor {
    public var swiftUIColor: Color {
        Color(uiColor: color)
    }
}
