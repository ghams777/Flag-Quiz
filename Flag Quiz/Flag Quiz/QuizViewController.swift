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
    
    
    // display nex question
    func nextQuestion() {
        
        questionNumberLabel.text = String(format: "Question %1$d of %2$d", (correctGuesses + 1), model.numberOfQuestions)
        answerLabel.text = ""
        correntAnswer = quizCountries.removeAtIndex(0)
        flagImageView.image = UIImage(named: correntAnswer) // next flag
        
        // re-enable UISegmentedControls and delete prior segments
        for segmentedControl in segmentedControls {
            segmentedControl.enabled = true
            segmentedControl.removeAllSegments()
        }
        
        // place guesses on displayed UISegmentedControls
        enabledCountries.shuffle()
        
    }
    
    
    @IBAction func submitGuess(sender: AnyObject) {
    }
    

}



// Array extension method for shuffling elements
extension Array {
    
    mutating func shuffle() {
        
        // Modern Fisher-Yates shuffle: http://bit.ly/FisherYates
        for first in (self.count-1).stride(through: 1, by: -1) {
            
            let second = Int(arc4random_uniform(UInt32(first + 1)))
            swap(&self[first], &self[second])
            
        }
        
    }
    
}

