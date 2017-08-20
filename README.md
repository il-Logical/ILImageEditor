# ILImageEditor

[![Version](https://img.shields.io/badge/pod-1.0.1-green.svg?style=flat-square)](http://cocoapods.org/pods/ILImageEditor)
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
### Initialization & Usage
````
import ILImageEditor

class ImageEditor {
	let editor = ILEditor()

	func operations(_ image: UIImage) {
		// Mend orientation of camera picked images.
		if let _image = editor.mendOrientation(ofImage: image) {
			// _image with fixed orientation.
		}

		// Rotate the image.
		// RotateOptions: clockwise, antiClockwise, horizontal, vertical
		if let _image = editor.rotate(theImage: image, withOption: .vertical) {
			// _image has the rotated/ mirrored image.
		}

		// Compress the image.
		// CompressionOptions: half, oneThird, oneFourth, oneFifth, oneTenth
		// Quality: 0.0 - 1.0
		if let _image = editor.compress(theImage: image, toSize: .oneThird, withQuality: 0.5) {
			// _image has the compressed image.
		}

		// Crop the image.
		do {
			let cropped = try editor.cropRect(theImage: image, cropRect: rect)
			if let _image = cropped {
				// _image is the cropped image.
			}
		}
		catch editor.EditorError.IncorrectCropFrame {
			// Incorrect crop frame provided.
		}
		catch {}
	}
}
````

## Author

Muqtadir Ahmed, muqtadirahmd@gmail.com

## License

ILImageEditor is available under the MIT license. See the LICENSE file for more info.
