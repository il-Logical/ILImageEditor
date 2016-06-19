//
//  ILImageOperator.swift
//  ILImageEditor
//
//  Created by Muqtadir Ahmed on 19/06/16.
//  Copyright © 2016 Muqtadir Ahmed. All rights reserved.
//

import Foundation
import UIKit

class ILImageOperator: NSObject {
    
    //MARK: - Image rotation operations performed here.
    
    func rotateImageClockWise(theImage: UIImage) -> UIImage {
        
        var orient: UIImageOrientation!
        let imgOrientation = theImage.imageOrientation
        
        switch imgOrientation {
            
        case .Left:
            orient = .Up
            
        case .Right:
            orient = .Down
            
        case .Up:
            orient = .Right
            
        case .Down:
            orient = .Left
            
        case .UpMirrored:
            orient = .RightMirrored
            
        case .DownMirrored:
            orient = .LeftMirrored
            
        case .LeftMirrored:
            orient = .UpMirrored
            
        case .RightMirrored:
            orient = .DownMirrored
        }
        
        let rotatedImage = UIImage(CGImage: theImage.CGImage!, scale: 1.0, orientation: orient)
        return rotatedImage
    }
    
    func rotateImageAntiClockWise(theImage: UIImage) -> UIImage {
        
        var orient: UIImageOrientation!
        let imgOrientation = theImage.imageOrientation
        
        switch imgOrientation {
            
        case .Left:
            orient = .Down
            
        case .Right:
            orient = .Up
            
        case .Up:
            orient = .Left
            
        case .Down:
            orient = .Right
            
        case .UpMirrored:
            orient = .LeftMirrored
            
        case .DownMirrored:
            orient = .RightMirrored
            
        case .LeftMirrored:
            orient = .DownMirrored
            
        case .RightMirrored:
            orient = .UpMirrored
        }
        
        let rotatedImage = UIImage(CGImage: theImage.CGImage!, scale: 1.0, orientation: orient)
        return rotatedImage
    }
    
    //MARK: - Image flipping operations performed here.
    
    func flipImageOnVerticalAxis(theImage: UIImage) -> UIImage {
        
        var orient: UIImageOrientation!
        let imgOrientation = theImage.imageOrientation
        
        switch imgOrientation {
            
        case .Left:
            orient = .RightMirrored
            
        case .Right:
            orient = .LeftMirrored
            
        case .Up:
            orient = .UpMirrored
            
        case .Down:
            orient = .DownMirrored
            
        case .UpMirrored:
            orient = .Up
            
        case .DownMirrored:
            orient = .Down
            
        case .LeftMirrored:
            orient = .Right
            
        case .RightMirrored:
            orient = .Left
        }
        
        let mirroredImage = UIImage(CGImage: theImage.CGImage!, scale: 1.0, orientation: orient)
        return mirroredImage
    }
    
    func flipImageOnHorizontalAxis(theImage: UIImage) -> UIImage {
        
        var orient: UIImageOrientation!
        let imgOrientation = theImage.imageOrientation
        
        switch imgOrientation {
            
        case .Left:
            orient = .LeftMirrored
            
        case .Right:
            orient = .RightMirrored
            
        case .Up:
            orient = .DownMirrored
            
        case .Down:
            orient = .UpMirrored
            
        case .UpMirrored:
            orient = .Down
            
        case .DownMirrored:
            orient = .Up
            
        case .LeftMirrored:
            orient = .Left
            
        case .RightMirrored:
            orient = .Right
        }
        
        let mirroredImage = UIImage(CGImage: theImage.CGImage!, scale: 1.0, orientation: orient)
        return mirroredImage
    }
}