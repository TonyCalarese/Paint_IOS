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
    position: CGPoint = CGPoint.zero //default to zero
    
    
    public func setBrushColor(_ color: UIColor) {
        self.brushColor = color //Set color
    }
    public func setBrushWidth(_ width: CGFloat) {
        self.brushWidth = width //Set width
    }
    public func setBrushOpacity(_ opacity: CGFloat) {
        self.brushOpacity = opacity //Set opacity
    }
    public func setLastPositionTouched(_ position: CGPoint) {
        self.position = position
    }
    
    public func getLastPosition() -> CGPoint {
        return self.position //Work Around until User defaults are configured
    }
    
    func buildFromDefaults() {
        print("Building Brush From Defaults")
        if let color = UserDefaults.standard.string(forKey: "color") {
            print(color)
            self.setBrushColor(UIColor(named: color)!)
        }
        if let width = UserDefaults.standard.string(forKey: "width") {
            print(width)
            self.setBrushWidth(CGFloat(truncating: NumberFormatter().number(from: width)!))
        }
        if let opacity = UserDefaults.standard.string(forKey: "opacity") {
            print(opacity)
            self.setBrushOpacity(CGFloat(truncating: NumberFormatter().number(from: opacity)!))
        }
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
      
        
        //Create Paintbrush
        return Paintbrush(brushColor: self.brushColor,
                          brushWidth: self.brushWidth,
                          brushOpacity: self.brushOpacity)
    }
}
