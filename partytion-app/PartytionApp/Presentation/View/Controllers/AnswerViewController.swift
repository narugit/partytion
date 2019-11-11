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
    
    @IBOutlet var answerProgress: UIProgressView!

    public var question_id: Int = 0
    private var presenter: AnswerPresenter!
    private var counter: Int = 0
    private var players: Int = 0
    private let wireframe: RootViewWireframe = RootViewWireframe()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.presenter = AnswerPresenter(question_id: question_id)
        
        let question: Questions? = presenter.getQuestion()
        
        self.questionText.text = question!.value(forKey: "question") as? String
        self.players = (question!.value(forKey: "players") as? Int)!
        self.answererCount.text = "\(self.counter+1) 人目/ \(self.players) 人中"
        
        self.answerProgress.progress = 0.0
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
        
        let progress: Float = Float(self.counter) / Float(self.players)
        self.answerProgress.setProgress(progress, animated: true)

        if (self.answerProgress.progress >= 1.0) {
            // プログレスバーが100%になってから遷移
            Timer.scheduledTimer(
                timeInterval: 0.3,
                target: self,
                selector: #selector(self.moveNextScreen),
                userInfo: nil,
                repeats: false
            )
        } else {
            self.answererCount.text = "\(self.counter+1) 人目/ \(self.players) 人中"
        }
    }

    // 結果表示画面への移行
    @objc private func moveNextScreen() {
        self.wireframe.transition(to: self.presenter.viewController!)
    }
}
