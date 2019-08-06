//
//  QuestionViewController.swift
//  PartytionApp
//
//  Created by naru on 2019/08/06.
//  Copyright © 2019 naruhiyo. All rights reserved.
//

import UIKit

class QuestionViewController: UIViewController {
    @IBOutlet var testText: UILabel!
    var playerNumber: String!
    
    // プログラムの読み込みが完了
    override func viewDidLoad() {
        super.viewDidLoad()
        testText.text = self.playerNumber
    }
    
}
