//
//  File.swift
//  
//
//  Created by Satheesh on 04/03/24.
//

import Foundation
import SwiftUI

struct MercurySearchBar: View {
    @Binding var text: String
    var config: MercurySearchBarConfig?
    var body: some View {
        HStack {
            Image("search_icon")
            TextField(config?.searchBarPlaceholder ?? "", text: $text)
                .foregroundColor(config?.searchBarFont.color)
                .font(.custom(config?.searchBarFont.name ?? "",
                              size: config?.searchBarFont.size ?? 14))
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
        .background(config?.searchBarBackgroundColor)
        .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}
