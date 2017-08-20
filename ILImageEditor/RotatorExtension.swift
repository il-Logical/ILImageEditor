//
//  RotatorExtension.swift
//  ILImageEditor
//
//  Created by Muqtadir Ahmed on 20/08/17.
//  Copyright © 2017 Muqtadir Ahmed. All rights reserved.
//

internal extension UIImage {
    
    func rotate(withOption option: ILEditor.RotateOptions) -> UIImage? {
        var toOrientation: UIImageOrientation
        
        // Find the new orientation.
        switch imageOrientation {
        case .up:
            toOrientation = [.right, .left, .upMirrored, .downMirrored][option.rawValue]
            
        case .down:
            toOrientation = [.left, .right, .downMirrored, .upMirrored][option.rawValue]
            
        case .left:
            toOrientation = [.up, .down, .rightMirrored, .leftMirrored][option.rawValue]
            
        case .right:
            toOrientation = [.down, .up, .leftMirrored, .rightMirrored][option.rawValue]
            
        case .upMirrored:
            toOrientation = [.rightMirrored, .leftMirrored, .up, .down][option.rawValue]
            
        case .downMirrored:
            toOrientation = [.leftMirrored, .rightMirrored, .down, .up][option.rawValue]
            
        case .leftMirrored:
            toOrientation = [.upMirrored, .downMirrored, .right, .left][option.rawValue]
            
        case .rightMirrored:
            toOrientation = [.downMirrored, .upMirrored, .left, .right][option.rawValue]
        }
        
        guard let cgImage = cgImage else { return nil }
        // Apply the new orientation.
        return UIImage(cgImage: cgImage, scale: scale, orientation: toOrientation)
    }
    
}
