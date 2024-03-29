//
//  File.swift
//  
//
//  Created by Satheesh on 22/02/24.
//

import Foundation
import SwiftUI

struct MercuryPrimaryButtonModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .frame(maxWidth: .infinity)
            .padding([.top, .bottom], 10)
            .foregroundColor(MercuryColor.primaryForeground.swiftUIColor)
            .background(MercuryColor.primaryBackground.swiftUIColor)
            .cornerRadius(44)
    }
}

struct MercurySecondaryButtonModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .frame(maxWidth: .infinity)
            .padding([.top, .bottom], 10)
            .foregroundColor(MercuryColor.secondaryForeground.swiftUIColor)
            .background(MercuryColor.secondaryBackground.swiftUIColor)
            .cornerRadius(44)
    }
}

extension View {
    public func mercuryPrimaryButton() -> some View {
        modifier(MercuryPrimaryButtonModifier())
    }
    
    public func mercurySecondaryButton() -> some View {
        modifier(MercurySecondaryButtonModifier())
    }
}
