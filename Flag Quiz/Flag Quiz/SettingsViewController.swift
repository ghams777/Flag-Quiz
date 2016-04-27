//
//  SettingsViewController.swift
//  Flag Quiz
//
//  Created by Admin on 4/25/16.
//  Copyright © 2016 Morra. All rights reserved.
//

import UIKit

class SettingsViewController: UIViewController {
    
    @IBOutlet var switches: [UISwitch]!
    @IBOutlet weak var guessesSegmentedControl: UISegmentedControl!
    
    var model: Model! // set by QuizViewController
    private var regionNames = ["Africa", "Asia", "Europe", "North_America", "Oceania", "South_America"]
    private let defaultRegionIndex = 3
    
    // used to determine whether any settings changed
    private var settingsChanged = false
    
    
    @IBAction func switchesChanged(sender: AnyObject) {
    }
}
