//
//  MercuryContentView.swift
//  
//
//  Created by Satheesh on 04/03/24.
//

import Foundation
import SwiftUI

struct MercuryContentView: View {
    @Binding var isPresentedPopUp: Bool
    @Binding var selected: Int
    var titles: [String]
    var primaryFont: MercuryFont?
    var subtitles: [String]?
    var secondaryFont: MercuryFont?
    var itemImages: [Image]?
    var onItemSelected: (() -> Void)? = nil
    
    var body: some View {
        VStack {
            ForEach(Array(titles.enumerated()), id: \.1) { (index, item) in
                VStack {
                    HStack {
                        if let image = itemImages?[index] {
                            image
                                .padding(.leading, 5)
                        }
                        VStack(alignment: .leading){
                            Text(item)
                                .font(primaryFont?.font)
                                .foregroundColor(primaryFont?.color)
                                .padding(0)
                            if let subTitle = subtitles?[index] {
                                Text(subTitle)
                                    .font(secondaryFont?.font)
                                    .foregroundColor(secondaryFont?.color)
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
