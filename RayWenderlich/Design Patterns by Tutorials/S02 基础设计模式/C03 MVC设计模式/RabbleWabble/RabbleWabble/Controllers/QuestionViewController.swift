//
//  QuestionViewController.swift
//  RabbleWabble
//
//  Created by Enrica on 2018/10/21.
//  Copyright © 2018 Enrica. All rights reserved.
//

import UIKit

class QuestionViewController: UIViewController {
    
    // MARK: - 实例属性
    
    public var questionGroup = QuestionGroup.basicPhrases()
    public var questionIndex = 0
    
    public var correctCount = 0
    public var incorrectCount = 0
    
    
    // MARK: - 计算属性
    
    public var questionView: QuestionView! {
        
        // 检查视图是否已经加载完毕
        guard isViewLoaded else { return nil }
        
        // 如果视图已经加载完毕，可强制将其转换为QuestionView类型
        return view as! QuestionView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        showQuestion()
    }
    
    private func showQuestion() {
        
        let question = questionGroup.questions[questionIndex]
        
        questionView.answerLabel.text = question.answer
        questionView.promptLabel.text = question.prompt
        questionView.hintLabel.text = question.hint
        
        questionView.answerLabel.isHidden = true
        questionView.hintLabel.isHidden = true
    }

    
    // MARK: - @IBActions
    
    @IBAction func handleIncorrect(_ sender: Any) {
        
        incorrectCount += 1
        questionView.incorrectCountLabel.text = "\(incorrectCount)"
        showNextQuestion()
    }
    
    @IBAction func handleCorrect(_ sender: Any) {
        
        correctCount += 1
        questionView.correctCountLabel.text = "\(correctCount)"
        showNextQuestion()
    }
    
    private func showNextQuestion() {
        questionIndex += 1
        
        guard questionIndex < questionGroup.questions.count else {
            // TODO: - Handle this...!
            return
        }
        showQuestion()
    }
    
    @IBAction func toggleAnswerLabels(_ sender: Any) {
        questionView.answerLabel.isHidden = !questionView.answerLabel.isHidden
        questionView.hintLabel.isHidden = !questionView.hintLabel.isHidden
    }
}

