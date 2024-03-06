//
//  MercurySearchBarView.swift
//  
//
//  Created by Satheesh on 04/03/24.
//

import Foundation
import SwiftUI

public struct MercurySearchBarConfig {
    var placeholder: String
    var backgroundColor: Color
    var font: MercuryFont
    
    public init(placeholder: String,
                backgroundColor: Color,
                font: MercuryFont) {
        self.placeholder = placeholder
        self.backgroundColor = backgroundColor
        self.font = font
    }
}

struct MercurySearchBar: View {
    @Binding var text: String
    var config: MercurySearchBarConfig?
    var body: some View {
        HStack {
            Image("search_icon")
            TextField(config?.placeholder ?? "", text: $text)
                .foregroundColor(config?.font.color)
                .font(config?.font.font)
            if !text.isEmpty {
                Button(action: {
                    text = ""
                }) {
                    Image(systemName: "xmark.circle.fill")
                        .foregroundColor(.gray)
                        .padding(.trailing, 8)
                }
            }
        }
        .padding(7)
        .background(config?.backgroundColor)
        .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}
