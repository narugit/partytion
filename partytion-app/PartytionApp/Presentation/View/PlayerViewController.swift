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
        let toolbar: UIToolbar = UIToolbar()
        let space = UIBarButtonItem(barButtonSystemItem: .flexibleSpace,
                                    target: nil,
                                    action: nil)
        let done = UIBarButtonItem(title: "done",
                                   style: .done,
                                   target: self,
                                   action: #selector(self.doneButtonAction))
        toolbar.items = [space, done]
        toolbar.sizeToFit()
        self.inputPlayerNumber.inputAccessoryView = toolbar
        self.inputPlayerNumber.keyboardType = .numberPad
    }
    
    @IBAction func nextButtonTapped(_ sender: Any) {
        self.moveQuestionScreen()
    }
    // 質問作成画面への移行
    private func moveQuestionScreen() {
        let questionStoryboard :UIStoryboard = UIStoryboard(name: "QuestionScreen", bundle: nil)
        let questionScreen :UIViewController = questionStoryboard.instantiateViewController(withIdentifier: "QuestionViewController")
        
        if let secondVC = questionScreen as? QuestionViewController {
            secondVC.playerNumber = inputPlayerNumber.text!
        }
        
        present(questionScreen, animated: true, completion: nil)
    }
    
    @objc func doneButtonAction()
    {
        self.inputPlayerNumber.resignFirstResponder()
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.inputPlayerNumber.resignFirstResponder()
    }
}
