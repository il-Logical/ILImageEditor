//
//  CompressorExtension.swift
//  ILImageEditor
//
//  Created by Muqtadir Ahmed on 20/08/17.
//  Copyright © 2017 Muqtadir Ahmed. All rights reserved.
//

internal extension UIImage {
    
    func compress(compressionRatio ratio: CGFloat, compressionQuality quality: CGFloat) -> UIImage? {
        
        var toHeight = size.height,
        toWidth = size.width,
        imgRatio = toWidth / toHeight
        
        let maxHeight = toHeight / ratio,
        maxWidth = toWidth / ratio,
        maxRatio = maxWidth / maxHeight
        
        // Adjust width according to maxHeight.
        if (toHeight > maxHeight || toWidth > maxWidth) {
            if imgRatio < maxRatio {
                
                imgRatio = maxHeight / toHeight
                toWidth = imgRatio * toWidth
                toHeight = maxHeight
            }
            // Adjust height according to maxWidth.
            else if imgRatio > maxRatio {
                
                imgRatio = maxWidth / toWidth
                toHeight = imgRatio * toHeight
                toWidth = maxWidth
            }
            else {
                
                toHeight = maxHeight
                toWidth = maxWidth
            }
        }
        
        // Draw the image in the new designed frame.
        let rect = CGRect(origin: .zero, size: CGSize(width: toWidth, height: toHeight))
        UIGraphicsBeginImageContext(rect.size)
        draw(in: rect)
        guard var img = UIGraphicsGetImageFromCurrentImageContext() else { return nil }
        UIGraphicsEndImageContext()
        
        // Apply quality compression.
        if quality != 1.0 {
            guard let imageData = UIImageJPEGRepresentation(img, quality) else { return nil }
            guard let temp = UIImage(data: imageData) else { return nil }
            img = temp
        }
        
        return img
    }
}
