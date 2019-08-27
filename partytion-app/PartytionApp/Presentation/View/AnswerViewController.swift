//
//  AnswerViewController.swift
//  PartytionApp
//
//  Created by tatsuya_oyanagi on 2019/08/06.
//  Copyright © 2019 naruhiyo. All rights reserved.
//

import UIKit

class AnswerViewController: UIViewController {
    @IBOutlet var yesButton: UIButton!
    @IBOutlet weak var noButton: UIButton!
    @IBOutlet private var questionText: UITextView!

    public var question_id: Int = 0
    private var presenter: AnswerPresenter!

    override func viewDidLoad() {
        super.viewDidLoad()

      
        self.presenter = AnswerPresenter(question_id: question_id)
        let question: Questions? = presenter.getQuestion()
        
        self.questionText.text = question?.value(forKey: "question") as? String
    }
    
    @IBAction func yesButtonTapped(_ sender: UIButton) {
        presenter.stuckAnswer(answerText: "Yes")
    }

    @IBAction func noButtonTapped(_ sender: UIButton) {
        presenter.stuckAnswer(answerText: "No")
    }
    
    // 結果表示画面への移行
    private func moveNextScreen() {
        // 質問作成画面への移行
        self.present(presenter.viewController!,
                     animated: true,
                     completion: nil
        )
    }
}
