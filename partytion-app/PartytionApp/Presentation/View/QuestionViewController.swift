//
//  QuestionViewController.swift
//  PartytionApp
//
//  Copyright © 2019 naruhiyo. All rights reserved.
//

import UIKit

class QuestionViewController: UIViewController {
    @IBOutlet var testText: UILabel!
    @IBOutlet var nextButton: UIButton!
    var playerNumber: String!
    
    // プログラムの読み込みが完了
    override func viewDidLoad() {
        super.viewDidLoad()
//        testText.text = self.playerNumber
    }
    
    @IBAction func nextButtonTapped(_ sender: UIButton) {
        self.moveToAnswerScreen()
    }

    // 質問作成画面への移行
    private func moveToAnswerScreen() {
        let answerStoryboard :UIStoryboard = UIStoryboard(name: "AnswerScreen", bundle: nil)
        let answerViewController :UIViewController = answerStoryboard.instantiateViewController(withIdentifier: "AnswerViewController")
        
        present(answerViewController, animated: true, completion: nil)
    }
    
}
