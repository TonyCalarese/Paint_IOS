//
//  PaintbruchBuilder.swift
//  Paint
//
//  Created by Tony Calarese on 6/25/20.
//  Copyright © 2020 Tony Calarese. All rights reserved.
//  Sources are Listed in the Sources_of_Reference.rtf file and are marked by number, please give credit where it is due

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
        if let color = UserDefaults.standard.getColor(forKey: "color") {
            print("Got Color")
            print(color)
            self.setBrushColor(color)
        }
        if let width = UserDefaults.standard.string(forKey: "width") {
            print("Got Width")
            print(width)
            self.setBrushWidth(CGFloat(truncating: NumberFormatter().number(from: width)!))
        }
        if let opacity = UserDefaults.standard.string(forKey: "opacity") {
            print("Got Opacity")
            print(opacity)
            self.setBrushOpacity(CGFloat(truncating: NumberFormatter().number(from: opacity)!))
        }
    }
    
    public func build() -> Paintbrush {
        buildFromDefaults() //Build off of the defaults
        //prevent nils from slipping by
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
