//
//  ILImageEditor.swift
//  ILImageEditor
//
//  Created by Muqtadir Ahmed on 19/06/16.
//  Copyright © 2016 Muqtadir Ahmed. All rights reserved.
//

import Foundation
import UIKit

public class ILImageEditor: NSObject {
    
    ///Operation class's singletons.
    private let ilFixer = ILImageFixer()
    private let ilOperator = ILImageOperator()
    private let ilCompressor = ILImageCompressor()
    private let ilCropper = ILImageCropper()
    
    ///Option provided by the program to edit images.
    public enum FlippingOptions: Int {
        case rotateClockWise = 0
        case rotateAntiClockWise
        case flipHorizontal
        case flipVertical
    }
    
    ///Options provided for compressing the image to some size.
    public enum CompressionOptions: CGFloat {
        case half = 2.0
        case oneThird = 3.0
        case oneFourth = 4.0
        case oneFifth = 5.0
    }
    
    ///Returns a UIImage with fixed orientation ready for upload!
    public func fixImageOrientation(image: UIImage) -> UIImage {
        return ilFixer.fixImageOrientation(image)
    }
    
    ///Returns a UIImage after performing the selected option's operation.
    public func editImageWithOptions(image: UIImage, withOptions option: FlippingOptions) -> UIImage {
        return [
            ilOperator.rotateImageClockWise(image),
            ilOperator.rotateImageAntiClockWise(image),
            ilOperator.flipImageOnHorizontalAxis(image),
            ilOperator.flipImageOnVerticalAxis(image)
            ][option.rawValue]
    }
    
    ///Returns a UIImage compressed to selected size.
    public func compressImageToSize(image: UIImage, withSize size: CompressionOptions, compressionQualtity: CGFloat) -> UIImage {
        return ilCompressor.compressImage(image, compressionRatio: size.rawValue, compressionQuality: compressionQualtity)
    }
    
    ///Returns a UIImage cropped at desired *CGRect*.
    public func cropAnImageToRect(image: UIImage, rectToCrop rect: CGRect) -> UIImage {
        return ilCropper.cropImageToRect(image, toCrop: rect)
    }
}