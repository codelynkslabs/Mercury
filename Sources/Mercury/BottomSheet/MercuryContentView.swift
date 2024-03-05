//
//  File.swift
//  
//
//  Created by Satheesh on 04/03/24.
//

import Foundation
import SwiftUI

struct MercuryContentView: View {
    @Binding var isPresentedPopUp: Bool
    var items: [String]
    var itemFont: MercuryFont
    var itemsSubTitle: [String]?
    var itemSubTileFont: MercuryFont?
    var itemImages: [Image]?
    var hasTwoLines: Bool = false
    @Binding var selected: Int
    var onItemSelected: (() -> Void)? = nil
    
    var body: some View {
        VStack {
            ForEach(Array(items.enumerated()), id: \.1) { (index, item) in
                VStack {
                    HStack {
                        if let image = itemImages?[index] {
                            image
                                .padding(.leading, 5)
                        }
                        VStack(alignment: .leading){
                            Text(item)
                                .font(.custom(itemFont.name, size: itemFont.size))
                                .foregroundColor(itemFont.color)
                                .padding(0)
                            if let subTitle = itemsSubTitle?[index] {
                                Text(subTitle)
                                    .font(.custom(itemSubTileFont?.name ?? "", size: itemSubTileFont?.size ?? 14))
                                    .foregroundColor(itemSubTileFont?.color)
                                    .padding(.top, 3)
                            }
                        }
                        .padding(.leading, 16)
                        .padding(.vertical, 16)
                        Spacer()
                        Button(action: {
                            onItemSelected?()
                            isPresentedPopUp = false
                            selected = index
                        }) {
                            selected == index
                            ? Image("SelectionFill")
                            : Image("Oval")
                        }
                        .padding(.trailing, 16)
                    }
                }
                Divider()
            }
        }
    }
}
