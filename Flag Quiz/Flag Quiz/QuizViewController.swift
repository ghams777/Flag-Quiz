//
//  ViewController.swift
//  Flag Quiz
//
//  Created by Admin on 4/25/16.
//  Copyright © 2016 Morra. All rights reserved.
//

import UIKit

class QuizViewController: UIViewController {

    @IBOutlet weak var flagImageView: UIImageView!
    @IBOutlet weak var answerLabel: UILabel!
    @IBOutlet weak var questionNumberLabel: UILabel!
    @IBOutlet var segmentedControl: [UISegmentedControl]!
    
    
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
    }
    
    @IBAction func submitGuess(sender: AnyObject) {
    }
    

}

