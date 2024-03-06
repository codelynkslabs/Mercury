//
//  MercuryBottomSheet.swift
//  
//
//  Created by Satheesh on 04/03/24.
//

import Foundation
import SwiftUI

public enum MercuryBottomSheetType {
    /// This will show the bottom sheet with a divider on top.
    case `default`
    /// This will show the bottom sheet with a search on top.
    case withSearchbar(placeholder: String, color: Color, font: MercuryFont)
    /// This will show the bottom sheet with a subtile view  on top.
    case withSubtitle(title: String, font: MercuryFont)
}

public struct MercurySubtitleConfig {
    var text: String
    var font: MercuryFont
    
    public init(text: String, font: MercuryFont) {
        self.text = text
        self.font = font
    }
}

public struct MercuryBottomSheetConfig {
    var titleFont: MercuryFont? = nil
    var itemFont: MercuryFont? = nil
    var itemsSubTitle: [String]? = nil
    var itemSubtitleFont: MercuryFont? = nil
    var itemsImages: [Image]? = nil
    var sheetType: MercuryBottomSheetType = .default
    
    public init(titleFont: MercuryFont? = nil, itemFont: MercuryFont? = nil, itemsSubTitle: [String]? = nil,
                itemSubtitleFont: MercuryFont? = nil, itemsImages: [Image]? = nil,
                sheetType: MercuryBottomSheetType = .default) {
        self.titleFont = titleFont
        self.itemFont = itemFont
        self.itemsSubTitle = itemsSubTitle
        self.itemSubtitleFont = itemSubtitleFont
        self.itemsImages = itemsImages
        self.sheetType = sheetType
    }
}

public struct MercuryBottomSheet: View {
    @Binding var isPresented: Bool
    @Binding var selectedIndex: Int
    @State private var searchFieldValue = ""
    let title: String
    var items: [String]
    var config: MercuryBottomSheetConfig? = nil
    var oncloseAction: ((Bool) -> Void)? = nil
    
    public init(isPresented: Binding<Bool>, selectedIndex: Binding<Int>, searchFieldValue: String = "",
                title: String, items: [String], config: MercuryBottomSheetConfig? = nil,
                oncloseAction: ((Bool) -> Void)? = nil) {
        self._isPresented = isPresented
        self._selectedIndex = selectedIndex
        self.searchFieldValue = searchFieldValue
        self.title = title
        self.items = items
        self.config = config
        self.oncloseAction = oncloseAction
    }
    
    public var body: some View {
        VStack {
            HStack {
                Text(title)
                    .font(config?.titleFont?.font)
                    .foregroundColor(config?.titleFont?.color)
                    .padding(16)
                Spacer()
                Button {
                    isPresented = false
                    oncloseAction?(false)
                }label: {
                    Image("Close")
                }
                .padding(.trailing, 16)
            }
            
            switch config?.sheetType {
            case .default:
                Divider()
                    .overlay(MercuryColor.rectangle1.swiftUIColor)
            case .withSearchbar(let placeholder, let color, let font):
                MercurySearchBar(text: $searchFieldValue, config: MercurySearchBarConfig(
                    placeholder: placeholder, backgroundColor: color, font: font))
            case .withSubtitle(let title, let font):
                MercurySubTitleView(config: MercurySubtitleConfig(text: title, font: font))
            case nil:
                Divider()
            }
            
            MercuryContentView(
                isPresentedPopUp: $isPresented,
                selected: $selectedIndex, titles: items,
                primaryFont: config?.itemFont,
                subtitles: config?.itemsSubTitle,
                secondaryFont: config?.itemSubtitleFont,
                itemImages: config?.itemsImages
            ){
                oncloseAction?(true)
            }
            Spacer()
        }
        .onChange(of: selectedIndex) { newValue in
            isPresented = false
            oncloseAction?(true)
        }
    }
}

struct MercurySubTitleView: View {
    var config: MercurySubtitleConfig?
    var body: some View {
        Divider()
        HStack {
            Text(config?.text ?? "").padding(.leading, 16)
                .font(config?.font.font)
                .foregroundColor(config?.font.color)
                .padding(.vertical, 10)
            Spacer()
        }
    }
}
