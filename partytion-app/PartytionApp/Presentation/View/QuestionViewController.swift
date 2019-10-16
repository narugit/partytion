//
//  QuestionViewController.swift
//  PartytionApp
//
//  Copyright © 2019 naruhiyo. All rights reserved.
//

import UIKit
import SSBouncyButton

class QuestionViewController: UIViewController, UITextFieldDelegate {
    @IBOutlet private var questionTheme: UILabel!
    @IBOutlet private var answerNumbers: UITextView!
    @IBOutlet private var nextButton: SSBouncyButton!
    @IBOutlet weak var questionText: PlaceHolderTextView!
    public var playerNumber: Int = 1
    private var presenter: QuestionPresenter!
    private let wireframe: RootViewWireframe = RootViewWireframe()
    
    // プログラムの読み込みが完了
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.questionText.keyboardType = UIKeyboardType.phonePad
        self.questionText.delegate = self as? UITextViewDelegate
        self.questionText.placeholder = "質問文"

        self.presenter = QuestionPresenter(playerNumber: playerNumber)
        
        self.questionTheme.text = presenter.theme
        self.answerNumbers.text = "\(presenter.answerPair.0) vs \(presenter.answerPair.1)になるような質問を 考えましょう！"
    }
    
    @IBAction func nextButtonTapped(_ sender: Any) {
        presenter.registerText(text: questionText.text)
        moveNextScreen()
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        // キーボードを閉じる
        textField.resignFirstResponder()
        return true
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        questionText.resignFirstResponder()
    }

    private func moveNextScreen() {
        self.wireframe.transition(to: self.presenter.viewController!)
    }
}
