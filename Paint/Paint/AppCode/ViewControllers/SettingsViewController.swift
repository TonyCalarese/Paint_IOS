//
//  SecondViewController.swift
//  Paint
//
//  Created by Tony Calarese on 6/25/20.
//  Copyright © 2020 Tony Calarese. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {

    @IBOutlet var widthLabel: UILabel!
    @IBOutlet var widthValue: UILabel!
    @IBOutlet var opacityLabel: UILabel!
    @IBOutlet var opacityValue: UILabel!
    @IBOutlet var opacityValueStepper: UIStepper!
    @IBOutlet var blackColorButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        UserDefaults.standard.set(UIColor.red, forKey: "color")
        UserDefaults.standard.set(25.0, forKey: "width")
        UserDefaults.standard.set(1.0, forKey: "opacity")
        CanvasViewController().buildBrush()
        
    }

}

