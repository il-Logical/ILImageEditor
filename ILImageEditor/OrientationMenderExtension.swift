//
//  OrientationMenderExtension.swift
//  ILselfEditor
//
//  Created by Muqtadir Ahmed on 20/08/17.
//  Copyright © 2017 Muqtadir Ahmed. All rights reserved.
//

internal extension UIImage {
    
    func mendOrientation() -> UIImage? {
        // No-op if the orientation is already correct.
        if imageOrientation == .up {
            return self
        }
        
        // We need to calculate the proper transformation to make the image upright.
        // We do it in 2 steps: Rotate if Left/Right/Down, and then flip if Mirrored.
        var transform: CGAffineTransform = .identity
        
        switch imageOrientation {
            
        case .down, .downMirrored:
            transform = transform.translatedBy(x: size.width, y: size.height)
            transform = transform.rotated(by: .pi)
            
        case .left, .leftMirrored:
            transform = transform.translatedBy(x: size.width, y: 0.0)
            transform = transform.rotated(by: (.pi/2.0))
            
        case .right, .rightMirrored:
            transform = transform.translatedBy(x: 0.0, y: size.height)
            transform = transform.rotated(by: (-.pi/2.0))
            
        default: break
            
        }
        
        switch imageOrientation {
        
        case .upMirrored, .downMirrored:
            transform = transform.translatedBy(x: size.width, y: 0.0)
            transform = transform.scaledBy(x: -1.0, y: 1.0)
            
        case .leftMirrored, .rightMirrored:
            transform = transform.translatedBy(x: size.height, y: 0.0)
            transform = transform.scaledBy(x: -1.0, y: 1.0)
        
        default: break
        
        }
        
        // Now we draw the underlying CGImage into a new context, applying the transform calculated above.
        guard let cgImage = cgImage else { return nil }
        let imageBitmapInfo = CGBitmapInfo(rawValue: CGImageAlphaInfo.noneSkipFirst.rawValue)
        guard let context = CGContext(data: nil,
                                width: size.width.toInt,
                                height: size.height.toInt,
                                bitsPerComponent: cgImage.bitsPerComponent,
                                bytesPerRow: cgImage.bytesPerRow,
                                space: cgImage.colorSpace!,
                                bitmapInfo: imageBitmapInfo.rawValue) else { return nil }
        
        // Applying transform.
        context.concatenate(transform)
        
        // Drawing image.
        switch imageOrientation {
        case .left, .leftMirrored, .right, .rightMirrored:
            context.draw(cgImage, in: CGRect(origin: .zero, size: CGSize(width: size.height, height: size.width)))
            
        default:
            context.draw(cgImage, in: CGRect(origin: .zero, size: size))
        }
        
        // And now we just create a new UIself from the drawing context
        guard let finalCG = context.makeImage() else { return nil }
        return UIImage(cgImage: finalCG)
    }
}
