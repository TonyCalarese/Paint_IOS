//
//  Paintbrush.swift
//  Paint
//
//  Created by Tony Calarese on 6/25/20.
//  Copyright © 2020 Tony Calarese. All rights reserved.
//  Main struct for the paintbursh tool used on the canvas
//Getters will always have a value in them due to how this class is builded
import Foundation
import UIKit

struct Paintbrush {
    let brushColor: UIColor?,
     brushWidth: CGFloat?,
     brushOpacity: CGFloat?
    
    public func getColor() -> UIColor {
        return brushColor!
    }
    public func getOpacity() -> CGFloat {
        return brushOpacity!
    }
    
    public func getWidth() -> CGFloat {
        return brushWidth!
    }
    
    public func getAllSpecs() -> (UIColor, CGFloat, CGFloat){
        return (brushColor!, brushWidth!, brushOpacity!)
    }
}
