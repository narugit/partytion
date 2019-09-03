//
//  QuestionViewController.swift
//  PartytionApp
//
//  Copyright © 2019 naruhiyo. All rights reserved.
//

import UIKit
import SSBouncyButton

class QuestionViewController: UIViewController {
    @IBOutlet private var questionTheme: UILabel!
    @IBOutlet private var answerNumbers: UITextView!
    @IBOutlet private var questionText: UITextField!
    @IBOutlet weak var nextButton: SSBouncyButton!
    
    public var playerNumber: Int = 0
    private var presenter: QuestionPresenter!
    
    // プログラムの読み込みが完了
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.questionText.keyboardType = UIKeyboardType.phonePad
        self.questionText.delegate = self as? UITextFieldDelegate

        self.presenter = QuestionPresenter(playerNumber: playerNumber)
        self.questionTheme.text = presenter.theme
        self.answerNumbers.text = "\(presenter.answerPair.0) vs \(presenter.answerPair.1)になるような質問を 考えましょう！"
    }
    
    @IBAction func nextButtonTapped(_ sender: Any) {
        presenter.registerText(text: questionText.text)
        moveNextScreen()
    }
        
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        // キーボードを閉じる
        textField.resignFirstResponder()
        return true
    }
    
    private func moveNextScreen() {
        // 質問作成画面への移行
        self.present(presenter.viewController!,
                     animated: true,
                     completion: nil
        )
    }
}
