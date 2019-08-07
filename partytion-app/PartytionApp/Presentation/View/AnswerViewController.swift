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

    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func yesButtonTapped(_ sender: UIButton) {
        self.moveToAnswerScreen()
    }

    @IBAction func noButtonTapped(_ sender: UIButton) {
        self.moveToAnswerScreen()
    }
    
    // 結果表示画面への移行
    private func moveToAnswerScreen() {
        let resultStoryboard :UIStoryboard = UIStoryboard(name: "ResultScreen", bundle: nil)
        let resultViewController :UIViewController = resultStoryboard.instantiateViewController(withIdentifier: "ResultViewController")
        
        present(resultViewController, animated: true, completion: nil)
    }
}
