//
//  ILImageFixer.swift
//  ILImageEditor
//
//  Created by Muqtadir Ahmed on 19/06/16.
//  Copyright © 2016 Muqtadir Ahmed. All rights reserved.
//

import Foundation
import UIKit

class ILImageFixer: NSObject {
    
    func fixImageOrientation(image: UIImage) -> UIImage {
        // No-op if the orientation is already correct
        if (image.imageOrientation == .Up) {
            return image
        }
        // We need to calculate the proper transformation to make the image upright.
        // We do it in 2 steps: Rotate if Left/Right/Down, and then flip if Mirrored.
        var transform: CGAffineTransform = CGAffineTransformIdentity
        if (image.imageOrientation == .Down
            || image.imageOrientation == .DownMirrored) {
            
            transform = CGAffineTransformTranslate(transform, image.size.width, image.size.height)
            transform = CGAffineTransformRotate(transform, CGFloat(M_PI))
        }
        if (image.imageOrientation == .Left
            || image.imageOrientation == .LeftMirrored) {
            
            transform = CGAffineTransformTranslate(transform, image.size.width, 0)
            transform = CGAffineTransformRotate(transform, CGFloat(M_PI_2))
        }
        if (image.imageOrientation == .Right
            || image.imageOrientation == .RightMirrored) {
            
            transform = CGAffineTransformTranslate(transform, 0, image.size.height);
            transform = CGAffineTransformRotate(transform,  CGFloat(-M_PI_2));
        }
        if (image.imageOrientation == .UpMirrored
            || image.imageOrientation == .DownMirrored) {
            
            transform = CGAffineTransformTranslate(transform, image.size.width, 0)
            transform = CGAffineTransformScale(transform, -1, 1)
        }
        if (image.imageOrientation == .LeftMirrored
            || image.imageOrientation == .RightMirrored) {
            
            transform = CGAffineTransformTranslate(transform, image.size.height, 0);
            transform = CGAffineTransformScale(transform, -1, 1);
        }
        // Now we draw the underlying CGImage into a new context, applying the transform
        // calculated above.
        let imageBitmapInfo = CGBitmapInfo(rawValue: CGImageAlphaInfo.NoneSkipFirst.rawValue)
        let context: CGContextRef = CGBitmapContextCreate(nil,
                                                          Int(image.size.width),
                                                          Int(image.size.height),
                                                          CGImageGetBitsPerComponent(image.CGImage),
                                                          CGImageGetBytesPerRow(image.CGImage),
                                                          CGImageGetColorSpace(image.CGImage),
                                                          imageBitmapInfo.rawValue)!
        CGContextConcatCTM(context, transform)
        if (image.imageOrientation == UIImageOrientation.Left
            || image.imageOrientation == UIImageOrientation.LeftMirrored
            || image.imageOrientation == UIImageOrientation.Right
            || image.imageOrientation == UIImageOrientation.RightMirrored
            ) {
            
            CGContextDrawImage(context, CGRectMake(0,0,image.size.height,image.size.width), image.CGImage)
        } else {
            CGContextDrawImage(context, CGRectMake(0,0,image.size.width,image.size.height), image.CGImage)
        }
        // And now we just create a new UIImage from the drawing context
        let cgimage: CGImageRef = CGBitmapContextCreateImage(context)!
        let imageEnd: UIImage = UIImage(CGImage: cgimage)
        return imageEnd
    }
}