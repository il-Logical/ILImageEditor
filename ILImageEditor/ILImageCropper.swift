//
//  ILImageCropper.swift
//  ILImageEditor
//
//  Created by Muqtadir Ahmed on 19/06/16.
//  Copyright © 2016 Muqtadir Ahmed. All rights reserved.
//

import Foundation
import UIKit

class ILImageCropper: NSObject {
    
    func cropImageToRect(image : UIImage, toCrop : CGRect) -> UIImage {
        let ref : CGImageRef = CGImageCreateWithImageInRect(image.CGImage, toCrop)!
        let returnImage = UIImage(CGImage: ref, scale: 1.0, orientation: image.imageOrientation)
        return returnImage
    }
}