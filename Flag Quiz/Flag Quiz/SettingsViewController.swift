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
    
    
    //called when SettingsViewController is displayed
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // select segment based on current number of guesses to display
        guessesSegmentedControl.selectedSegmentIndex = model.numberOfGuesses / 2 - 1
        
        // set switches based on currently selected regions
        for i in 0 ..< switches.count {
            
            switches[i].on = model.regions[regionNames[i]]!
        }
    }
    
    
    @IBAction func switchesChanged(sender: AnyObject) {
    }
}
