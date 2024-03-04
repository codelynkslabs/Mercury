//
//  File.swift
//  
//
//  Created by Satheesh on 28/02/24.
//

import Foundation
import SwiftUI

public struct MercuryConfig {
    var primaryText: String
    var secondaryText1: String
    var secondaryText2: String
    var primaryFont: MercuryFont
    var secondaryFont: MercuryFont
    
    public init(primaryText: String, secondaryText1: String, secondaryText2: String,
                primaryFont: MercuryFont, secondaryFont: MercuryFont) {
        self.primaryText = primaryText
        self.secondaryText1 = secondaryText1
        self.secondaryText2 = secondaryText2
        self.primaryFont = primaryFont
        self.secondaryFont = secondaryFont
    }
}

public struct MercuryFont {
    var color: Color
    var name: String
    var size: CGFloat
    
    public init(color: Color,name: String, size: CGFloat) {
        self.color = color
        self.name = name
        self.size = size
    }
}

public struct MercurySlider: View {
    @Binding var progressValue: Float
    var config: MercuryConfig
    var mercurySliderDraggingEnded: (() -> Void)
    
    public init(progressValue: Binding<Float>, config: MercuryConfig,
                mercurySliderDraggingEnded: @escaping (() -> Void)) {
        self._progressValue = progressValue
        self.config = config
        self.mercurySliderDraggingEnded = mercurySliderDraggingEnded
    }
    
    public var body: some View {
        VStack {
            Text(config.primaryText)
                .font(.custom(config.primaryFont.name, size: config.primaryFont.size))
                .foregroundColor(config.primaryFont.color)
            HStack {
                Text(config.secondaryText1)
                    .font(.custom(config.secondaryFont.name, size: config.secondaryFont.size))
                    .foregroundColor(config.secondaryFont.color)
                    .padding(.leading, 16)
                Spacer()
                Text(config.secondaryText2)
                    .font(.custom(config.secondaryFont.name, size: config.secondaryFont.size))
                    .foregroundColor(config.secondaryFont.color)
                    .padding(.trailing, 16)
            }
            Image("topBackgroundSlider")
            MercuryProgressBar(progress: $progressValue, draggingEnded: {
                mercurySliderDraggingEnded()
            })
            Image("bottomBackgroundSlider")
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
            Image("sliderThumb")
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
