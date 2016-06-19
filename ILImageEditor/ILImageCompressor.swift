//
//  ILImageCompressor.swift
//  ILImageEditor
//
//  Created by Muqtadir Ahmed on 19/06/16.
//  Copyright © 2016 Muqtadir Ahmed. All rights reserved.
//

import Foundation
import UIKit

class ILImageCompressor: NSObject {
    
    func compressImage(image: UIImage, compressionRatio: CGFloat, compressionQuality: CGFloat) -> UIImage {
        
        var actualHeight = image.size.height
        var actualWidth = image.size.width
        let maxHeight = actualHeight / compressionRatio
        let maxWidth = actualWidth / compressionRatio
        var imgRatio = actualWidth / actualHeight
        let maxRatio = maxWidth / maxHeight
        
        if (actualHeight > maxHeight || actualWidth > maxWidth) {
            if (imgRatio < maxRatio) {
                //adjust width according to maxHeight
                imgRatio = maxHeight / actualHeight
                actualWidth = imgRatio * actualWidth
                actualHeight = maxHeight
            } else if (imgRatio > maxRatio) {
                //adjust height according to maxWidth
                imgRatio = maxWidth / actualWidth
                actualHeight = imgRatio * actualHeight
                actualWidth = maxWidth
            } else {
                actualHeight = maxHeight;
                actualWidth = maxWidth;
            }
        }
        
        let rect = CGRectMake(0.0, 0.0, actualWidth, actualHeight)
        UIGraphicsBeginImageContext(rect.size)
        image.drawInRect(rect)
        var img = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        
        if compressionQuality != 1.0 {
            let imageData = UIImageJPEGRepresentation(img, compressionQuality)
            img = UIImage(data: imageData!)!
        }
        
        return img
    }
}