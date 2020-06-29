//
//  FirstViewController.swift
//  Paint
//
//  Created by Tony Calarese on 6/25/20.
//  Copyright © 2020 Tony Calarese. All rights reserved.
//  Code Referenced from tutorial: https://www.raywenderlich.com/5895-uikit-drawing-tutorial-how-to-make-a-simple-drawing-app

import UIKit

class CanvasViewController: UIViewController {
    var continuousSwipe = false //Bool for brushing lines
    let brush = PaintbrushBuilder()
    var paintbrush: Paintbrush?

    @IBOutlet public var canvas: UIImageView!
    @IBAction func ClearCanvas(_ sender: Any) {
        canvas.image = nil //clear the canvas
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        buildBrush()
    }

    
    //Function to Build to Brush
    public func buildBrush() {
        print("Building Brush")
        brush.buildFromDefaults()
        paintbrush = brush.build() //Build the default brush
    }
    //Code for touching the Image view
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        guard let touch = touches.first else {
          return
        }
        continuousSwipe = false
          brush.setLastPositionTouched(touch.location(in: view)) //Set the position where they touched
      }
      
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
           guard let touch = touches.first else {
             return
           }
           continuousSwipe = true
          let start = brush.getLastPosition()
          let finish = touch.location(in: view)
          
        draw(start: start, finish: finish) //draw the line from start to finish
          
          brush.setLastPositionTouched(finish) //set the position they left off of as the last point Touched
         }
    func draw(start: CGPoint, finish: CGPoint) {
     let (color, width, opacity) = (paintbrush?.getAllSpecs())! //get all the brush values
     
      UIGraphicsBeginImageContext(view.frame.size)
      guard let context = UIGraphicsGetCurrentContext() else {
        return
      }
      canvas.image?.draw(in: view.bounds)
        
      context.move(to: start)
      context.addLine(to: finish)
      
      // 3
      context.setLineCap(.round)
      context.setBlendMode(.normal)
      context.setLineWidth(width)
      context.setStrokeColor(color.cgColor)
      
      // 4
      context.strokePath()
      
      // 5
      canvas.image = UIGraphicsGetImageFromCurrentImageContext()
     //canvas.alpha = paintbrush?.getOpacity() as! CGFloat
     canvas.alpha = opacity
     UIGraphicsEndImageContext()
    }



}

