//
//  UserDefaultExtensions.swift
//  Paint
//
//  Created by Tony Calarese on 6/30/20.
//  Copyright © 2020 Tony Calarese. All rights reserved.
//  Sources are Listed in the Sources_of_Reference.rtf file and are marked by number, please give credit where it is due


import UIKit
import Foundation

extension UserDefaults {
     // Code referenced from Source 2
     func setColor(color: UIColor?, forKey key: String) {
        var colorData: NSData?
        if let color = color {
            do {
                colorData = try NSKeyedArchiver.archivedData(withRootObject: color, requiringSecureCoding: false) as NSData?
            } catch {
                print("Failed to Save Color")
            }
        }
        set(colorData, forKey: key)// UserDefault Built-in Method into Any?
        }
    // EOF Source 2 reference
    
    //Function for getting the set color
    func getColor(forKey key: String) -> UIColor? {
        
        guard UserDefaults.standard.data(forKey: key) != nil else {
            return UIColor.black //Default to black if key does not exist
        }
        do {
        //Code referenced from Source 3
            if let color = try  NSKeyedUnarchiver.unarchiveTopLevelObjectWithData(UserDefaults.standard.data(forKey: key)!) as? UIColor {
                 return color
               }
        }catch {
            print("Failed to find or get set color")
            return nil //return nil if it fails to convert
        }
        //EOF Source 3 reference
        return nil //return nil if it fails to find
    }
}
