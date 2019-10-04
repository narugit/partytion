//
//  AnswerViewController.swift
//  PartytionApp
//
//  Created by tatsuya_oyanagi on 2019/08/06.
//  Copyright © 2019 naruhiyo. All rights reserved.
//

import UIKit
import SSBouncyButton

class AnswerViewController: UIViewController {
    @IBOutlet private var yesButton: SSBouncyButton!
    @IBOutlet private var noButton: SSBouncyButton!
    @IBOutlet private var questionText: UITextView!
    @IBOutlet private var answererCount: UITextView!
    
    public var question_id: Int = 0
    private var presenter: AnswerPresenter!
    private var counter: Int = 0
    private var players: Int = 0

    override func viewDidLoad() {
        super.viewDidLoad()

      
        self.presenter = AnswerPresenter(question_id: question_id)
        
        let question: Questions? = presenter.getQuestion()
        
        self.questionText.text = question!.value(forKey: "question") as? String
        self.players = (question!.value(forKey: "players") as? Int)!
        self.answererCount.text = "\(self.counter+1) / \(self.players)"
    }
    
    @IBAction func yesButtonTapped(_ sender: UIButton) {
        self.countAnswerNumber(text: "yes")
    }

    @IBAction func noButtonTapped(_ sender: UIButton) {
        self.countAnswerNumber(text: "no")
    }

    private func countAnswerNumber(text: String) {
        self.presenter.stuckAnswer(answerText: text)
        self.counter += 1
        self.answererCount.text = "\(self.counter+1) / \(self.players)"

        if (counter >= players) {
            moveNextScreen()
        }
    }

    // 結果表示画面への移行
    private func moveNextScreen() {
        // 結果画面への移行
        self.present(presenter.viewController!,
                     animated: true,
                     completion: nil
        )
    }
}
