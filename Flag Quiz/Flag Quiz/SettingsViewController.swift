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
    
    
    @IBAction func switchesChanged(sender: AnyObject) {
    }
}
