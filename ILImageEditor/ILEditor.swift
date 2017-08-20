//
//  ILEditor.swift
//  ILImageEditor
//
//  Created by Muqtadir Ahmed on 20/08/17.
//  Copyright © 2017 Muqtadir Ahmed. All rights reserved.
//

import UIKit

public class ILEditor {
    
    enum EditorError: Error {
        case IncorrectCropFrame
    }
    
    enum RotateOptions: Int {
        case clockWise = 0, antiClockWise, vertical, horizontal
    }
    
    enum CompressionOptions: CGFloat {
        case half = 2.0
        case oneThird = 3.0
        case oneFourth = 4.0
        case oneFifth = 5.0
        case oneTenth = 10.0
    }
    
    /**
        Mends the image orientation that is by default rotated.
     
        - Parameter image: Image on which the operation needs to be performed on.
     
        - Returns: The mended image or nil if something did not add up.
    */
    func mendOrientation(ofImage image: UIImage) -> UIImage? {
        return image.mendOrientation()
    }
    
    /**
        Rotates the passed image.
     
        - Parameter image: Image on which the operation needs to be performed on.
     
        - Parameter option: The way in which the image needs to be rotated.
     
        - Returns: The rotated image or nil if something did not add up.
    */
    func rotate(theImage image: UIImage, withOption option: RotateOptions) -> UIImage? {
        return image.rotate(withOption: option)
    }
    
    /**
        Compressed the passed image.
     
        - Parameter image: Image on which the operation needs to be performed on.
     
        - Parameter compression: The ratio to which the image needs to be compressed.
     
        - Parameter quality: The image compression quality. Can range from `0.0 (Bad) - 1.0 (Good)`, **default** is `1.0`.
     
        - Returns: The compressed image or nil if something did not add up.
     */
    func compress(theImage image: UIImage, toSize compression: CompressionOptions, withQuality qualtity: CGFloat = 1.0) -> UIImage? {
        return image.compress(compressionRatio: compression.rawValue, compressionQuality: qualtity)
    }
    
    /**
        Crops the passed image.
     
        - Parameter image: Image on which the operation needs to be performed on.
     
        - Parameter rect: The `CGRect` that needs to be cropped and returned.
     
        - Throws: `EditotError.IncorrectCropFrame` if the passed `rect` parameter is not croppable from the passed image.
     
        - Returns: The cropped image or nil if something did not add up.
     
    */
    func crop(theImage image: UIImage, cropRect rect: CGRect) throws -> UIImage? {
        do
        {
            return try image.crop(cropRect: rect)
        }
        catch {
            throw EditorError.IncorrectCropFrame
        }
    }
}

internal extension CGFloat {
    // Converts the passed CGFloat value to Int.
    var toInt: Int {
        return Int(self.rounded())
    }
    
}
