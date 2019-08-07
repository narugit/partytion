//
//  ViewController.swift
//  partytion-app
//
//  Created by tatsuya_oyanagi on 2019/07/22.
//  Copyright © 2019 naruhiyo. All rights reserved.
//

import UIKit

class MainViewController: UIViewController {
    @IBOutlet var labeltest :UILabel!
    @IBOutlet var buttonTest :UIButton!
    @IBOutlet var toQuestionButton :UIButton!
    @IBOutlet var toAnswerButton :UIButton!
    @IBOutlet var toResultButton: UIButton!
    var count = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // ボタンを押した時に実行するメソッドを指定
        toQuestionButton.addTarget(self, action: #selector(toQuestionScreen(_:)), for: UIControl.Event.touchUpInside)

        toAnswerButton.addTarget(self, action: #selector(toAnswerScreen(_:)), for: UIControl.Event.touchUpInside)

    }

    @IBAction func sampleButtonTapped(_ sender : Any) {
        count += 1
        if(count%2 == 0){
            labeltest.text = "Swift Test"
        }
        else{
            labeltest?.text = "tapped ! hogehoge"
        }
    }
    
    @objc func toQuestionScreen(_ sender: UIButton) {
        let questionScreen :UIStoryboard = UIStoryboard(name: "QuestionScreen", bundle: nil)
        let questionViewController :UIViewController = questionScreen.instantiateViewController(withIdentifier: "QuestionViewController")
        present(questionViewController, animated: true, completion: nil)
        print("ボタンの情報: \(sender)")
    }
    
    
    @objc func toAnswerScreen(_ sender: UIButton) {
        let answerScreen :UIStoryboard = UIStoryboard(name: "AnswerScreen", bundle: nil)
        let answerViewController :UIViewController = answerScreen.instantiateViewController(withIdentifier: "AnswerViewController")
        present(answerViewController, animated: true, completion: nil)
        print("ボタンの情報: \(sender)")
    }
    
    @IBAction func toResultScreen(_ sender: Any) {
        let resultScreen :UIStoryboard = UIStoryboard(name: "ResultScreen", bundle: nil)
        let resultViewController :UIViewController = resultScreen.instantiateViewController(withIdentifier: "ResultViewController")
        present(resultViewController, animated: true, completion: nil)
    }
}

