# Roatlas

[![Version](https://img.shields.io/cocoapods/v/Roatlas.svg?style=flat)](https://cocoapods.org/pods/Roatlas)
[![License](https://img.shields.io/cocoapods/l/Roatlas.svg?style=flat)](https://cocoapods.org/pods/Roatlas)
[![Platform](https://img.shields.io/cocoapods/p/Roatlas.svg?style=flat)](https://cocoapods.org/pods/Roatlas)

Roatlas is a component that offers a customizable UI component capable of providing a method of <ins>searching</ins> and <ins>selecting</ins> localities in Romania.

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

![Screenshots](https://i.ibb.co/5X3d3zS/image-5.jpg)

### Code example

Let's take one example from the project and explain the customization step by step.

- Here, the default style is set (which will customize the component when it's not expanded). The properties are pretty straight forward and their utility can be inferred by their name.
```swift
 let defaultStyle = ROViewStyle(backgroundColor: color1, cornerRadius: 12, borderWidth: 0.5, borderColor: .lightGray, shadowOffset: .zero, shadowOpacity: 1, shadowRadius: 2, shadowColor: .lightGray)
```

-  The component style in expanded mode is set. Be aware that the ```backgroundColor``` will be aplied to the search view, and not the result view (the part of the component where the results are appearing)
```swift
let expandedStyle = ROViewStyle(backgroundColor: color1, cornerRadius: 12, borderWidth: 0.5, borderColor: .darkGray, shadowOffset: .zero, shadowOpacity: 0.5, shadowRadius: 2, shadowColor: .black)
```
- The result view is the part of the component where the settlements will appear as the user types. Here, we're setting its style. While displaying settlements there is the ```type``` property that can have 2 values ```.settlement``` or ```.settlementAndCounty```. The latter includes the county of the settlement in the results view.
```swift
let resultStyle = ROResultStyle(backgroundColor: .white, separatorColor: .lightGray, selectionColor: .white, type: .settlementAndCounty, font: .boldSystemFont(ofSize: 20), textColor: .lightGray, selectedTextColor: .brown, maxViewHeight: 300)
```

- The ```ROSearchViewStyle``` is the class that contain all of the custom properties that should apply to the component.
We're telling the component how it should render in search mode (when not expanded), in expanded mode and while displaying results. Also, the clear button can appear in 4 different situations which are the exact same 4 situation of the default clear button of UITextField.
```swift
let searchViewStyle = ROSearchViewStyle(searchViewStyle: defaultStyle,
                                        expandedStyle: expandedStyle,
                                        resultViewStyle: resultStyle,
                                        clearButtonType: .always,
                                        clearImage: clearImage,
                                        separatorHeight: 1,
                                        separatorColor: .brown,
                                        searchFont: .systemFont(ofSize: 25),
                                        searchTextColor: .black,
                                        searchPlaceholder: "Type a few letters")
```

- This method call applies our style to the component.
```swift
searchView1.customize(using: searchViewStyle)
```

- This protocol method is called whenever the user selects a settlement, returning the selected element.
```swift
public protocol ROSearchViewDelegate: AnyObject {
    func didSelectResult(settlement: Settlement)
}
```
## Requirements

- iOS 11 or later

## Installation

Roatlas is available through [CocoaPods](https://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod 'Roatlas'
```

## Author

Daniel Gogozan, gogozandaniel@gmail.com

## License

Roatlas is available under the MIT license. See the LICENSE file for more info.

## Mentions
Shout out to [Romanian Open Source Data](https://github.com/romania/localitati) who provided the info about the settlements in Romania and [SwiftCSV](https://github.com/swiftcsv/SwiftCSV) who created an elegant manner of manipulating .csv data in Swift.
