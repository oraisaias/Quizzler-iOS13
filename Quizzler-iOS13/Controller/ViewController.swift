//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var questionLabel: UILabel!
    
    @IBOutlet weak var progressBar: UIProgressView!
    
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var falseButton: UIButton!
    @IBOutlet weak var ScoreLabel: UILabel!
    var quizBrain = QuizBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        ScoreLabel.text = "Score: \(quizBrain.getScore())"
        updateUI()
    }
    
   
    @IBAction func answerButtonPressed(_ sender: UIButton) {
        let userAnswer = sender.currentTitle!
        let userGotItRight = quizBrain.checkAnswer(userAnswer)
        
        if userGotItRight {
            sender.backgroundColor = UIColor.green
        } else {
            sender.backgroundColor = UIColor.red
        }
        
        quizBrain.nextQuestion()
        Timer.scheduledTimer(timeInterval: 0.2, target:self , selector: #selector(updateUI),userInfo: nil, repeats: false)
        
    }
    
    
    @objc func updateUI() {
        
        
        // Esperar 1 segundo antes de limpiar los colores
        self.trueButton.backgroundColor = UIColor.clear
        self.falseButton.backgroundColor = UIColor.clear
        self.questionLabel.text = quizBrain.getQuestionText()
        progressBar.progress = quizBrain.getProgress()
        ScoreLabel.text = "Score: \(quizBrain.getScore())"
        
    }
    
    
}

