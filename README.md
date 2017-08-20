# ILImageEditor

[![Version](https://img.shields.io/badge/pod-0.1.0-green.svg?style=flat-square)](http://cocoapods.org/pods/ILImageEditor)
[![License](https://img.shields.io/badge/license-MIT-yellow.svg?style=flat-square)](http://cocoapods.org/pods/ILImageEditor)
[![Platform](https://img.shields.io/badge/platform-iOS-red.svg?style=flat-square)](http://cocoapods.org/pods/ILImageEditor)

## Description
It is a simple image editor that performs most basic yet widely performed operations on an image like rotation, mirroring of images, resizing and cropping.

## Features
- Rotation
- Mirroring of image
- Compression / Resizing
- Cropping
- Fix orientation

## Requirements
- iOS 9.0+

## Usage

ILImageEditor is available on CocoaPods. Simply add the following line to your podfile:

```
pod 'ILImageEditor'
```

Alternatively, download the files and drag them in your Xcode project.

## Getting Started
### Initialization
````
import ILImageEditor

class ImageEditor {
	var editor = ILImageEditor()
}
````

### Usage
#### Fix incorrect image orientation.

```
public func fixImageOrientation(image: UIImage) -> UIImage
```

#### Perform rotation, mirroring operations.

`
public func editImageWithOptions(image: UIImage, withOptions option: FlippingOptions) -> UIImage
`

####Compress or resize image.
`
public func compressImageToSize(image: UIImage, withSize size: CompressionOptions, compressionQualtity: CGFloat) -> UIImage
`

####Crop image to given rect.
`
public func cropAnImageToRect(image: UIImage, rectToCrop rect: CGRect) -> UIImage
`

## Author

Muqtadir Ahmed, muqtadirahmd@gmail.com

## License

ILImageEditor is available under the MIT license. See the LICENSE file for more info.
