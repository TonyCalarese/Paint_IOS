//
//  PaintbruchBuilder.swift
//  Paint
//
//  Created by Tony Calarese on 6/25/20.
//  Copyright © 2020 Tony Calarese. All rights reserved.
//  Builder class for declaring the paintbrush when drawing

import Foundation
import UIKit

class PaintbrushBuilder {
    var brushColor: UIColor?,
    brushWidth: CGFloat?,
    brushOpacity: CGFloat?,
    position: CGPoint?
    
    
    public func setBrushColor(_ color: UIColor) {
        UserDefaults.standard.set(color, forKey: "color") //set default
        self.brushColor = color //Set color
    }
    public func setBrushWidth(_ width: CGFloat) {
        UserDefaults.standard.set(width, forKey: "width") //set default
        self.brushWidth = width //Set width
    }
    public func setBrushOpacity(_ opacity: CGFloat) {
        UserDefaults.standard.set(opacity, forKey: "opacity") //set default
        self.brushOpacity = opacity //Set opacity
    }
    public func setPosition(_ position: CGPoint) {
        UserDefaults.standard.set(position, forKey: "pos") //set default
    }
    
    
    public func build() -> Paintbrush {
        //guarding the Paintbrush to ensure that everything is filled
        if brushColor == nil {
            self.brushColor = UIColor.black //default to black
        }
        if brushWidth == nil{
           self.brushWidth = 5.0 //default to 5.0
        }
        if brushOpacity == nil {
            self.brushOpacity = 1.0 //default to 100%
        }
        if position == nil {
            self.position = CGPoint.zero //default to zero
        }
        
        //Create Paintbrush
        return Paintbrush(brushColor: self.brushColor,
                          brushWidth: self.brushWidth,
                          brushOpacity: self.brushOpacity)
    }
}
