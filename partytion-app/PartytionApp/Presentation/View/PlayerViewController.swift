//
//  PlayerViewController.swift
//  PartytionApp
//
//  Created by naru on 2019/08/06.
//  Copyright © 2019 naruhiyo. All rights reserved.
//

import UIKit

class PlayerViewController: UIViewController {
    @IBOutlet var inputPlayerNumber: UITextField!
    @IBOutlet var nextButton: UIButton!
    
    // プログラムの読み込みが完了
    override func viewDidLoad() {
        super.viewDidLoad()
        self.inputPlayerNumber.keyboardType = UIKeyboardType.numberPad
    }
    
    @IBAction func nextButtonTapped(_ sender: Any) {
        self.moveQuestionScreen()
    }
    // 質問作成画面への移行
    private func moveQuestionScreen() {
        let questionStoryboard :UIStoryboard = UIStoryboard(name: "QuestionScreen", bundle: nil)
        let questionScreen :UIViewController = questionStoryboard.instantiateViewController(withIdentifier: "QuestionViewController")
        
        if let secondVC = questionScreen as? QuestionViewController {
            secondVC.playerNumber = inputPlayerNumber.text
        }
        
        present(questionScreen, animated: true, completion: nil)
    }
    
}
