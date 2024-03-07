# Mercury

## Description

This repository is a component library which can be reused.

## Components

### Button

![4A7412A0-FC31-4229-B7C2-D6CC7B257BBD_4_5005_c](https://github.com/codelynkslabs/Mercury/assets/108679701/e1d17f0c-1d34-409f-b14b-c86a939e3a3e)

### Slider

![A6238067-80FF-4C85-91B1-ED8AE99E72D7_4_5005_c](https://github.com/codelynkslabs/Mercury/assets/108679701/3ec0076e-f964-4726-97fc-5cb69d07bdb1)

### Bottom Sheet

![mercuryBottomSheet](https://github.com/codelynkslabs/Mercury/assets/108679701/bde443a1-34a4-46c0-9797-aaf99a0fb62a)

## Guidelines: Customization

To utilize the Mercury button in your SwiftUI project, simply apply the `mercuryPrimaryButton()` or `mercurySecondaryButton()` modifier directly to your Button view, enabling seamless integration of Mercury's predefined styles.

```swift
Button("Lorem Ipsum") {
  //action
}
.mercuryPrimaryButton()
```



You can seamlessly incorporate the slider into your project by utilizing `MercurySlider()` and tailor its appearance and behavior to your preferences through the configurable attributes provided in the `config` parameter.

```swift
MercurySlider(
  progressValue: <#T##Binding<Float>#>,
  config: MercuryConfig(
    primaryText: <#T##String#>,
    leftLabel: <#T##String#>,
    rightLabel: <#T##String#>,
    primaryFont: <#T##MercuryFont#>,
    secondaryFont: <#T##MercuryFont#>
  ),
  mercurySliderDraggingEnded: <#T##() -> Void#>
)
```

Integrate the bottom sheet into your project by invoking `MercuryBottomSheet()` and tailor its behavior and appearance as needed using the provided configuration options (`config`).

```swift
MercuryBottomSheet(
  isPresented: <#T##Binding<Bool>#>,
  selectedIndex: <#T##Binding<Int>#>,
  title: <#T##String#>,
  items: <#T##[String]#>,
  config: <#T##MercuryBottomSheetConfig?#>
)
```

## Installation

Add `pod 'Mercury', :git => 'https://github.com/codelynkslabs/Mercury.git'` to your pod file.

## Compatibility

The Mercury package is designed to be compatible with `iOS 15.0` and above
