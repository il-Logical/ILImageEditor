//
//  CropperExtension.swift
//  ILImageEditor
//
//  Created by Muqtadir Ahmed on 20/08/17.
//  Copyright © 2017 Muqtadir Ahmed. All rights reserved.
//

internal extension UIImage {
    
    func crop(cropRect rect: CGRect) throws -> UIImage? {
        // Check if the passed CGRect lies within the image size. If not throw an exception.
        guard CGRect(origin: .zero, size: size).contains(rect) else { throw ILEditor.EditorError.IncorrectCropFrame }
        guard let cgImage = cgImage else { return nil }
        // Crop.
        guard let cropped = cgImage.cropping(to: rect) else { return nil }
        return UIImage(cgImage: cropped, scale: scale, orientation: imageOrientation)
    }
    
}
