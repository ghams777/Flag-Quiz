//
//  ViewController.swift
//  Flag Quiz
//
//  Created by Admin on 4/25/16.
//  Copyright © 2016 Morra. All rights reserved.
//

import UIKit

class QuizViewController: UIViewController, ModelDelegate {

    @IBOutlet weak var flagImageView: UIImageView!
    @IBOutlet weak var answerLabel: UILabel!
    @IBOutlet weak var questionNumberLabel: UILabel!

    @IBOutlet var segmentedControls: [UISegmentedControl]!
    
    private var model: Model! // reference to the model object
    
    private let correctColor = UIColor(red: 0.0, green: 0.75, blue: 0.0, alpha: 1.0)
    private let incorrectColor = UIColor.redColor()
    
    
    private var quizCountries: [String]! = nil // countries in quiz
    private var enabledCountries: [String]! = nil // countries for guesses
    
    private var correntAnswer: String! = nil
    private var correctGuesses = 0
    private var totalGuesses = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        // create Model
        model = Model(delegate: self)
        settingChanged()
    }
    
    
    // SettingsDelegate: reconfigures quiz when user changes settings: also called when app first loads
    func settingChanged() {
        enabledCountries = model.enabledRegionCountries
        resetQuiz()
    }
    
    
    // start q new quiz
    func resetQuiz() {
        quizCountries = model.newQuizCountries() // countries in new quiz
        correctGuesses = 0
        totalGuesses = 0
        
        //display appropriate # of UISegmentedControls
        for i in 0 ..< segmentedControls.count {
            segmentedControls[i].hidden = (i < model.numberOfGuesses / 2) ? false : true
        }
        
        nextQuestion() // display the first flag in quiz
    }
    
    
    @IBAction func submitGuess(sender: AnyObject) {
    }
    

}

