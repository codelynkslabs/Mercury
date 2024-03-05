//
//  File.swift
//  
//
//  Created by Satheesh on 04/03/24.
//

import Foundation
import SwiftUI

public struct MercurySearchBarConfig {
    var searchBarPlaceholder: String
    var searchBarBackgroundColor: Color
    var searchBarFont: MercuryFont
    
    public init(searchBarPlaceholder: String,
                searchBarBackgroundColor: Color,
                searchBarFont: MercuryFont) {
        self.searchBarPlaceholder = searchBarPlaceholder
        self.searchBarBackgroundColor = searchBarBackgroundColor
        self.searchBarFont = searchBarFont
    }
}

public struct MercurySubtitleConfig {
    var subTitle: String
    var subTitleFont: MercuryFont
    
    public init(subTitle: String, subTitleFont: MercuryFont) {
        self.subTitle = subTitle
        self.subTitleFont = subTitleFont
    }
}

public struct MercuryBottomSheet: View {
    @Binding var isPresentedPopUp: Bool
    @Binding var selected: Int
    @State private var searchFieldValue = ""
    let title: String
    var titleFont: MercuryFont
    var items: [String]
    var itemFont: MercuryFont
    var itemsSubTitle: [String]? = nil
    var itemSubtitleFont: MercuryFont? = nil
    var itemsImages: [Image]? = nil
    var isSearchBarEnabled: Bool? = nil
    var configSearchBar: MercurySearchBarConfig? = nil
    var configSubtitleView: MercurySubtitleConfig? = nil
    var oncloseAction: ((Bool) -> Void)? = nil
    
    public init(isPresentedPopUp: Binding<Bool>, selected: Binding<Int>,
                searchFieldValue: String = "", title: String, titleFont: MercuryFont ,items: [String],
                itemFont: MercuryFont, itemsSubTitle: [String]? = nil, itemSubtitleFont: MercuryFont? = nil,
                itemsImages: [Image]? = nil, isSearchBarEnabled: Bool? = nil,
                searchBarPlaceholder: String? = nil, configSearchBar: MercurySearchBarConfig? = nil,
                configSubtitleView: MercurySubtitleConfig? = nil,
                oncloseAction: ((Bool) -> Void)? = nil) {
        self._isPresentedPopUp = isPresentedPopUp
        self._selected = selected
        self.searchFieldValue = searchFieldValue
        self.title = title
        self.titleFont = titleFont
        self.items = items
        self.itemFont = itemFont
        self.itemsSubTitle = itemsSubTitle
        self.itemSubtitleFont = itemSubtitleFont
        self.itemsImages = itemsImages
        self.isSearchBarEnabled = isSearchBarEnabled
        self.configSearchBar = configSearchBar
        self.configSubtitleView = configSubtitleView
        self.oncloseAction = oncloseAction
    }
    
    public var body: some View {
        VStack {
            HStack {
                Text(title)
                    .font(.custom(titleFont.name, size: titleFont.size))
                    .foregroundColor(titleFont.color)
                    .padding(.leading, 16)
                    .padding(.vertical, 16)
                Spacer()
                Button {
                    isPresentedPopUp = false
                    oncloseAction?(false)
                }label: {
                    Image("Close")
                }
                .padding(.trailing, 16)
            }
            
            if  !(isSearchBarEnabled ?? true) {
                MercurySubTitleView(subTitle: configSubtitleView?.subTitle,
                             subTitleFont: configSubtitleView?.subTitleFont)
            } else if isSearchBarEnabled ?? false {
                MercurySearchBar(text: $searchFieldValue,config: configSearchBar)
            } else {
                Divider()
                    .overlay(MercuryColor.rectangle1.swiftUIColor)
            }
            
            MercuryContentView(
                isPresentedPopUp: $isPresentedPopUp,
                items: items,
                itemFont: itemFont,
                itemsSubTitle: itemsSubTitle,
                itemSubTileFont: itemSubtitleFont,
                itemImages: itemsImages,
                selected: $selected
            ){
                oncloseAction?(true)
            }
            Spacer()
        }
        .onChange(of: selected) { newValue in
            isPresentedPopUp = false
            oncloseAction?(true)
        }
    }
}

struct MercurySubTitleView: View {
    let subTitle: String?
    let subTitleFont: MercuryFont?
    var body: some View {
        Divider()
        HStack {
            Text(subTitle ?? "").padding(.leading, 16)
                .font(.custom(subTitleFont?.name ?? "", size: subTitleFont?.size ?? 12))
                .foregroundColor(subTitleFont?.color)
                .padding(.vertical, 10)
            Spacer()
        }
    }
}
