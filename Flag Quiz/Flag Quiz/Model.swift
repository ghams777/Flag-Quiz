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
    
    
}
