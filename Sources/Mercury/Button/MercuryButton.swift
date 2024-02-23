//
//  File.swift
//  
//
//  Created by Satheesh on 22/02/24.
//

import Foundation
import SwiftUI

struct MercuryPrimaryButton: ViewModifier {
    func body(content: Content) -> some View {
        content
            .frame(maxWidth: .infinity)
            .padding([.top, .bottom], 10)
            .foregroundColor(MercuryColor.Base.xfdb426.swiftUIColor)
            .background(MercuryColor.Base.xffffff.swiftUIColor)
            .cornerRadius(44)
    }
}

struct MercurySecondaryButton: ViewModifier {
    func body(content: Content) -> some View {
        content
            .frame(maxWidth: .infinity)
            .padding([.top, .bottom], 10)
            .foregroundColor(MercuryColor.Base.xfcfcfc.swiftUIColor)
            .background(MercuryColor.Base.x25292d.swiftUIColor)
            .cornerRadius(44)
    }
}
