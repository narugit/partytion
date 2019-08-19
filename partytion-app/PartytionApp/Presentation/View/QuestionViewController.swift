//
//  QuestionViewController.swift
//  PartytionApp
//
//  Copyright © 2019 naruhiyo. All rights reserved.
//

import UIKit

class QuestionViewController: UIViewController {
    @IBOutlet private var questionTheme: UILabel!
    @IBOutlet private var answerNumbers: UITextView!
    @IBOutlet private var questionText: UITextField!
    @IBOutlet private var nextButton: UIButton!
    
    public var playerNumber: String = "0"
    private var presenter: QuestionPresenter!
    
    // プログラムの読み込みが完了
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.questionText.keyboardType = UIKeyboardType.phonePad

        self.presenter = QuestionPresenter(playerNumber: Int(playerNumber)!)
        self.questionTheme.text = presenter.theme
        self.answerNumbers.text = "\(presenter.answerPair.0) vs \(presenter.answerPair.1)になるような質問を 考えましょう！"
    }
    
    @IBAction func nextButtonTapped(_ sender: UIButton) {
        // 質問作成画面への移行
        self.present(presenter.viewController!,
                     animated: true,
                     completion: nil
        )
    }
}
