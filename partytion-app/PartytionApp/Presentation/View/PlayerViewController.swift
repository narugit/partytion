//
//  PlayerViewController.swift
//  PartytionApp
//
//  Created by naru on 2019/08/06.
//  Copyright © 2019 naruhiyo. All rights reserved.
//

import UIKit
import GMStepper
import SSBouncyButton

class PlayerViewController: UIViewController {
    @IBOutlet weak var inputPlayerNumber: GMStepper!
    @IBOutlet weak var nextButton: SSBouncyButton!
    
    // プログラムの読み込みが完了
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func nextButtonTapped(_ sender: Any) {
        self.moveQuestionScreen()
    }
    
    // 質問作成画面への移行
    private func moveQuestionScreen() {
        let questionStoryboard :UIStoryboard = UIStoryboard(name: "QuestionScreen", bundle: nil)
        let questionScreen :UIViewController = questionStoryboard.instantiateViewController(withIdentifier: "QuestionViewController")
        
        if let secondVC = questionScreen as? QuestionViewController {
            secondVC.playerNumber = Int(inputPlayerNumber.value)
        }
        
        present(questionScreen, animated: true, completion: nil)
    }
    
}
