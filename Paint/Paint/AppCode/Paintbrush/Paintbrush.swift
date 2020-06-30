//
//  Paintbrush.swift
//  Paint
//
//  Created by Tony Calarese on 6/25/20.
//  Copyright © 2020 Tony Calarese. All rights reserved.
//  Sources are Listed in the Sources_of_Reference.rtf file and are marked by number, please give credit where it is due

//  Main struct for the paintbursh tool used on the canvas

import Foundation
import UIKit

//Globals
let brush = PaintbrushBuilder()
var paintbrush: Paintbrush?

//Paintbrush OBJ
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
    //Function to Build to Brush
    public func buildBrush() {
        
        paintbrush = brush.build() //Build the brush
    }
}



