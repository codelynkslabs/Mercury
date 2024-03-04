//
//  File.swift
//  
//
//  Created by Satheesh on 28/02/24.
//

import Foundation
import SwiftUI

public struct MercuryConfig {
    var primaryColor: Color
    var secondaryColor: Color
    var primaryFont: MercuryFont
    var secondaryFont: MercuryFont
    
    public init(primaryColor: Color, secondaryColor: Color,
                primaryFont: MercuryFont, secondaryFont: MercuryFont) {
        self.primaryColor = primaryColor
        self.secondaryColor = secondaryColor
        self.primaryFont = primaryFont
        self.secondaryFont = secondaryFont
    }
}

public struct MercuryFont {
    var name: String
    var size: CGFloat
    
    public init(name: String, size: CGFloat) {
        self.name = name
        self.size = size
    }
}

public struct MercurySlider: View {
    @Binding var progressValue: Float
    var text: String
    var mercurySliderDraggingEnded: (() -> Void)
    var config: MercuryConfig
    
    public init(progressValue: Binding<Float>, text: String, config: MercuryConfig,
                mercurySliderDraggingEnded: @escaping (() -> Void)) {
        self._progressValue = progressValue
        self.text = text
        self.mercurySliderDraggingEnded = mercurySliderDraggingEnded
        self.config = config
    }
    
    public var body: some View {
        VStack {
            Text(text)
                .font(.custom(config.primaryFont.name, size: config.primaryFont.size))
                .foregroundColor(config.primaryColor)
            HStack {
                Text("Low")
                    .font(.custom(config.secondaryFont.name, size: config.secondaryFont.size))
                    .foregroundColor(config.secondaryColor)
                    .padding(.leading, 16)
                Spacer()
                Text("High")
                    .font(.custom(config.secondaryFont.name, size: config.secondaryFont.size))
                    .foregroundColor(config.secondaryColor)
                    .padding(.trailing, 16)
            }
            Image("TopPrgressviewbg")
            MercuryProgressBar(progress: $progressValue, draggingEnded: {
                mercurySliderDraggingEnded()
            })
            Image("BottomProgressbg")
            Spacer()
        }.padding(.top, 16)
    }
}

struct MercuryProgressBar: View {
    @Binding var progress: Float
    var draggingEnded: (() -> Void)
    
    var body: some View {
        ZStack(alignment: .leading) {
            // Track
            RoundedRectangle(cornerRadius: 5)
                .foregroundColor(MercuryColor.rectangle1.swiftUIColor)
                .frame(height: 10)
            
            // Progress
            RoundedRectangle(cornerRadius: 5)
                .foregroundColor(MercuryColor.rectangle2.swiftUIColor)
                .frame(width: (UIScreen.main.bounds.width - 32) * CGFloat(progress), height: 10)
            
            // Thumb Image
            Image("progressthumb")
                .aspectRatio(contentMode: .fit)
                .frame(width: 20, height: 20)
                .padding(.top, 4)
                .offset(x: (UIScreen.main.bounds.width - 32) * CGFloat(progress) - 7)
        }
        .padding(.horizontal, 16)
        .gesture(
            DragGesture(minimumDistance: 0)
            .onEnded ({
                value in
                draggingEnded()
            })
            .onChanged({
                value in
                let totalWidth = UIScreen.main.bounds.width - 32
                let progress = (value.location.x - 16) / totalWidth
                self.progress = Float(max(0, min(progress, 1)))
            })
        )
    }
}
