//
//  FirstViewController.swift
//  Paint
//
//  Created by Tony Calarese on 6/25/20.
//  Copyright © 2020 Tony Calarese. All rights reserved.
//  Code Referenced from tutorial: https://www.raywenderlich.com/5895-uikit-drawing-tutorial-how-to-make-a-simple-drawing-app

import UIKit

class CanvasViewController: UIViewController {
    var continuousSwipe = false
    let brush = PaintbrushBuilder()
    var paintbrush: Paintbrush?
    /*
       var lastPoint = CGPoint.zero
       var brushColor = UIColor.black
       var brushWidth: CGFloat = 10.0
       var brushOpacity: CGFloat = 1.0
       var swiped = false
       */
    @IBAction func ClearCanvas(_ sender: Any) {
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        paintbrush = brush.build() //Build the default brush
        // Do any additional setup after loading the view.
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
      guard let touch = touches.first else {
        return
      }
      continuousSwipe = false
      setLastPointTouched(touch.location(in: view)) //Set the position where they touched
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
         guard let touch = touches.first else {
           return
         }
         continuousSwipe = true
        let start = CGPointFromString(UserDefaults.standard.string(forKey: "pos"))
        let finish = touch.location(in: view)
        
        paintbrush.draw(start: start, finish: finish) //draw the line from start to finish
        
        setLastPointTouched(finish) //set the position they left off of as the last point Touched
       }
    
    func setLastPointTouched(_ point: CGPoint) {
        UserDefaults.standard.set(point, forKey: "pos") //Set the position where they touched
    }

}

