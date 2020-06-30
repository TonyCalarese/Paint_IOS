//
//  FirstViewController.swift
//  Paint
//
//  Created by Tony Calarese on 6/25/20.
//  Copyright © 2020 Tony Calarese. All rights reserved.
// Sources are Listed in the Sources_of_Reference.rtf file and are marked by number, please give credit where it is due

import UIKit

class CanvasViewController: UIViewController {
    var continuousSwipe = false //Bool for brushing lines
    //let brush = PaintbrushBuilder()
    // var paintbrush: Paintbrush?

    @IBOutlet public var canvas: UIImageView!
    @IBAction func ClearCanvas(_ sender: Any) {
        canvas.image = nil //clear the canvas
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        paintbrush = brush.build()
    }

    //Code refernced from Source 1
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
      context.setLineCap(.round)
      context.setBlendMode(.normal)
      context.setLineWidth(width)
      context.setStrokeColor(color.cgColor)

      context.strokePath()

      canvas.image = UIGraphicsGetImageFromCurrentImageContext()
     
      canvas.alpha = opacity
     UIGraphicsEndImageContext()
    }
    //EOF Source 1 reference


}

