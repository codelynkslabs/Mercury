//
//  MercuryBottomSheet.swift
//  
//
//  Created by Satheesh on 04/03/24.
//

import Foundation
import SwiftUI

public struct MercurySubtitleConfig {
    var subTitle: String
    var subTitleFont: MercuryFont
    
    public init(subTitle: String, subTitleFont: MercuryFont) {
        self.subTitle = subTitle
        self.subTitleFont = subTitleFont
    }
    
    var font: Font {
        return Font.custom(self.subTitleFont.name, size: self.subTitleFont.size)
    }
}

public struct MercuryBottomSheetConfig {
    var itemsSubTitle: [String]? = nil
    var itemSubtitleFont: MercuryFont? = nil
    var itemsImages: [Image]? = nil
    var isSearchBarEnabled: Bool? = nil
    var configSearchBar: MercurySearchBarConfig? = nil
    var configSubtitleView: MercurySubtitleConfig? = nil
    
    public init(itemsSubTitle: [String]? = nil, itemSubtitleFont: MercuryFont? = nil,
                itemsImages: [Image]? = nil, isSearchBarEnabled: Bool? = nil,
                configSearchBar: MercurySearchBarConfig? = nil,
                configSubtitleView: MercurySubtitleConfig? = nil) {
        self.itemsSubTitle = itemsSubTitle
        self.itemSubtitleFont = itemSubtitleFont
        self.itemsImages = itemsImages
        self.isSearchBarEnabled = isSearchBarEnabled
        self.configSearchBar = configSearchBar
        self.configSubtitleView = configSubtitleView
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
    var config: MercuryBottomSheetConfig? = nil
    var oncloseAction: ((Bool) -> Void)? = nil
    
    public init(isPresentedPopUp: Binding<Bool>, selected: Binding<Int>,searchFieldValue: String = "",
                title: String, titleFont: MercuryFont, items: [String], itemFont: MercuryFont,
                config: MercuryBottomSheetConfig? = nil, oncloseAction: ((Bool) -> Void)? = nil) {
        self._isPresentedPopUp = isPresentedPopUp
        self._selected = selected
        self.searchFieldValue = searchFieldValue
        self.title = title
        self.titleFont = titleFont
        self.items = items
        self.itemFont = itemFont
        self.config = config
        self.oncloseAction = oncloseAction
    }
    
    public var body: some View {
        VStack {
            HStack {
                Text(title)
                    .font(.custom(titleFont.name, size: titleFont.size))
                    .foregroundColor(titleFont.color)
                    .padding(16)
                Spacer()
                Button {
                    isPresentedPopUp = false
                    oncloseAction?(false)
                }label: {
                    Image("Close")
                }
                .padding(.trailing, 16)
            }
            
            if let searchbarEnabled = config?.isSearchBarEnabled {
                if searchbarEnabled {
                    MercurySearchBar(text: $searchFieldValue,config: config?.configSearchBar)
                } else {
                    MercurySubTitleView(config: config?.configSubtitleView)
                }
            } else {
                Divider()
                    .overlay(MercuryColor.rectangle1.swiftUIColor)
            }
            
            MercuryContentView(
                isPresentedPopUp: $isPresentedPopUp,
                selected: $selected, titles: items,
                primaryFont: itemFont,
                subtitles: config?.itemsSubTitle,
                secondaryFont: config?.itemSubtitleFont,
                itemImages: config?.itemsImages
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
    var config: MercurySubtitleConfig?
    var body: some View {
        Divider()
        HStack {
            Text(config?.subTitle ?? "").padding(.leading, 16)
                .font(config?.font)
                .foregroundColor(config?.subTitleFont.color)
                .padding(.vertical, 10)
            Spacer()
        }
    }
}
