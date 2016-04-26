//
//  Model.swift
//  Flag Quiz
//
//  Created by Admin on 4/26/16.
//  Copyright © 2016 Morra. All rights reserved.
//

import Foundation


// adopted by delegate so it can be notified when settings change
protocol ModelDelegate {
    func settingChanged()
}

class Model {
    
    // keys for storing data in the app's NSUserDefaults
    private let regionsKey = "FlagQuizKeyRegions"
    private let guessesKey = "FlagQuizKeyGuesses"
    
    // reference to QuizViewController to notify it when settings change
    private var delegate: ModelDelegate! = nil
    
    var numberOfGuesses = 4 // number of guesses to display
    private var enabledRegions = [
        "Africa": false,
        "Asia": false,
        "Europe": false,
        "North_America": true,
        "Oceania": false,
        "South_America": false
    ]
    
    // variables for maintaining quiz data
    let numberOfQuestions = 10
    private var allCountries: [String] = []
    private var countriesInEnabledRegions: [String] = []
    
    
    
    // initialize the Settings from the app's NSUserDefaults
    init(delegate: ModelDelegate) {
        self.delegate = delegate
        
        // get the NSUserDefaults object for the app
        let userDefaults = NSUserDefaults.standardUserDefaults()
        
        // get number of guesses
        let tempGuesses = userDefaults.integerForKey(guessesKey)
        if tempGuesses != 0 {
            numberOfGuesses = tempGuesses
        }
        
        // get Dictionary containing the region settings
        if let tempRegions = userDefaults.dictionaryForKey(regionsKey) {
            self.enabledRegions = tempRegions as! [String: Bool]
        }
        
        // get a list of all the png files in the app's images group
        let paths = NSBundle.mainBundle().pathsForResourcesOfType("png", inDirectory: nil) as [String]
        
        // get image filenames from paths
        for path in paths {
            
            if let pathImage = NSURL(string: path) {
                
                if !((pathImage.lastPathComponent?.hasPrefix("AppIcon"))!) {
                    
                    allCountries.append(pathImage.lastPathComponent!)
                    
                }
            
            }
        }
        
        regionsChanged() // populate contriesInEnabledRegions
        
    }
    
    
    
    
    
    // load countriesInEnabledRegions
    func regionsChanged() {
        
        countriesInEnabledRegions.removeAll()
        
        for filename in allCountries {
            let region = filename.componentsSeparatedByString("-")[0]
            
            if !(enabledRegions[region]!) {
                countriesInEnabledRegions.append(filename)
            }
        }
        
    }
    
    
    
}
