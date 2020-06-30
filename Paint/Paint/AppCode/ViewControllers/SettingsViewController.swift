//
//  SecondViewController.swift
//  Paint
//
//  Created by Tony Calarese on 6/25/20.
//  Copyright © 2020 Tony Calarese. All rights reserved.
// Sources are Listed in the Sources_of_Reference.rtf file and are marked by number, please give credit where it is due

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet var widthLabel: UILabel!
    @IBOutlet var widthValue: UILabel!
    @IBOutlet var opacityLabel: UILabel!
    @IBOutlet var opacityValue: UILabel!
    
    @IBOutlet var widthSlider: UISlider!
    @IBOutlet var opacitySlider: UISlider!
    
    @IBOutlet var blackColorButton: UIButton!
    
    //Adjusting the sliders
    @IBAction func adjWidth(_ sender: UISlider) {
        setLabelText(label: widthValue, value: String(sender.value))
    }
    @IBAction func adjOpactity(_ sender: UISlider) {
        setLabelText(label: opacityValue, value: String(sender.value))
    }
    //On load the labels need to adjust to the value of the slider
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
       setLabelText(label: widthValue, value: String(widthSlider.value))
        setLabelText(label: opacityValue, value: String(opacitySlider.value))
    }
    
    //When the user leaves set the user defaults and settings over
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        UserDefaults.standard.setColor(color: UIColor.red, forKey: "color") //set Color
        UserDefaults.standard.set(widthSlider.value, forKey: "width") //Set Width
        UserDefaults.standard.set(opacitySlider.value, forKey: "opacity") //set Opacity
        
        paintbrush?.buildBrush() //rebuild the brush
    }
 
    //Dynamic function for setting label text
    func setLabelText(label: UILabel, value: String) {
        label.text = value
    }

}
