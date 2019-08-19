//
//  QuestionPresenter.swift
//  PartytionApp
//
//  Created by tatsuya_oyanagi on 2019/08/19.
//  Copyright © 2019 naruhiyo. All rights reserved.
//

import UIKit

class QuestionPresenter: BasePresenter {
    var nextView: String { return "Answer" }

    private let questionThemes = [ "ゲーム", "飲み会", "ニュース", "あるあるネタ" ]
    public private(set) var theme: String = ""
    private var playerNumber: Int = 0
    public private(set) var answerPair = (0, 0)

    private var storyboard: UIStoryboard? = nil
    public private(set) var viewController: UIViewController? = nil

    init(playerNumber: Int) {
        self.playerNumber = playerNumber
        
        self.answerPair.0 = Int.random(in: 1 ... playerNumber)
        self.answerPair.1 = playerNumber - self.answerPair.0
        
        self.theme = questionThemes[ Int.random(in: 1 ... questionThemes.count) ]
        
        self.setNextViewController()
    }
    
    func setNextViewController() -> Void {
        self.storyboard = UIStoryboard(name: "\(nextView)Screen", bundle: nil)
        self.viewController = self.storyboard!.instantiateViewController(withIdentifier: "\(nextView)ViewController")
    }
}
