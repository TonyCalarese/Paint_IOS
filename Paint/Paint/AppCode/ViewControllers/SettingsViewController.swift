//
//  SecondViewController.swift
//  Paint
//
//  Created by Tony Calarese on 6/25/20.
//  Copyright © 2020 Tony Calarese. All rights reserved.
// Sources are Listed in the Sources_of_Reference.rtf file and are marked by number, please give credit where it is due

import UIKit

class SettingsViewController: UIViewController {
    //Outlets
    @IBOutlet var widthLabel: UILabel!
    @IBOutlet var widthValue: UILabel!
    @IBOutlet var opacityLabel: UILabel!
    @IBOutlet var opacityValue: UILabel!
    
    @IBOutlet var widthSlider: UISlider!
    @IBOutlet var opacitySlider: UISlider!
    
    //Actions
    //Brush Colors
    @IBAction func blackColorButton(_ sender: Any) {
        setBrushColor(UIColor.black)
    }
    @IBAction func redColorButton(_ sender: Any) {
        setBrushColor(UIColor.red)
    }
    
    @IBAction func blueColorButton(_ sender: Any) {
        setBrushColor(UIColor.blue)
    }
    @IBAction func orangeColorButton(_ sender: Any) {
        setBrushColor(UIColor.orange)
    }
    @IBAction func pinkColorButton(_ sender: Any) {
        setBrushColor(UIColor.systemPink)
    }
    @IBAction func greenColorButton(_ sender: Any) {
        setBrushColor(UIColor.green)
    }
    
    
    //Adjusting the sliders
    @IBAction func adjWidth(_ sender: UISlider) {
        setLabelText(label: widthValue, value: String(sender.value))
    }
    @IBAction func adjOpactity(_ sender: UISlider) {
        setLabelText(label: opacityValue, value: String(sender.value))
    }
    //Dynamic function for setting label text
     func setLabelText(label: UILabel, value: String) {
         label.text = value
     }
     
     func setBrushColor(_ color: UIColor){
           UserDefaults.standard.setColor(color: color, forKey: "color") //set Color
     }
     
     func getWidth_Opacity() -> (CGFloat, CGFloat){
         var w: CGFloat = 10.0, o: CGFloat = 10.0
         if let width = UserDefaults.standard.string(forKey: "width") {
             w = CGFloat(truncating: NumberFormatter().number(from: width)!)
                    
                }
         if let opacity = UserDefaults.standard.string(forKey: "opacity") {
             o = CGFloat(truncating: NumberFormatter().number(from: opacity)!)

                }
         return (w, o)
     }

    //On load the labels need to adjust to the value of the slider
    override func viewDidLoad() {
        super.viewDidLoad()
        let (width, opacity) = getWidth_Opacity()
        widthSlider.setValue(Float(width), animated: true)
        opacitySlider.setValue(Float(opacity), animated: true)
        
        // Do any additional setup after loading the view.
       setLabelText(label: widthValue, value: String(widthSlider.value))
        setLabelText(label: opacityValue, value: String(opacitySlider.value))
    }
    
    //When the user leaves set the user defaults and settings over
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        //UserDefaults.standard.setColor(color: UIColor.red, forKey: "color") //set Color
        //It is more costly to set the width and opacity everytime it is changed so going to change it on destroy
        UserDefaults.standard.set(widthSlider.value, forKey: "width") //Set Width
        UserDefaults.standard.set(opacitySlider.value, forKey: "opacity") //set Opacity
        
        paintbrush?.buildBrush() //rebuild the brush
    }
 
 
}
