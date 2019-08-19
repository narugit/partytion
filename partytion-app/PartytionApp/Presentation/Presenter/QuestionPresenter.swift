//
//  QuestionPresenter.swift
//  PartytionApp
//
//  Created by tatsuya_oyanagi on 2019/08/19.
//  Copyright © 2019 naruhiyo. All rights reserved.
//

import UIKit

class QuestionPresenter {
    public private(set) var answerPair = (0, 0)

    private var nextView: String = "Answer"
    
    private var playerNumber: Int = 0
    private var storyboard: UIStoryboard? = nil
    public private(set) var viewController: UIViewController? = nil

    init(playerNumber: Int) {
        self.playerNumber = playerNumber
        
        self.answerPair.0 = Int.random(in: 1 ... playerNumber)
        self.answerPair.1 = playerNumber - self.answerPair.0
        
        self.setUpViewController()
    }
    
    private func setUpViewController() -> Void {
        self.storyboard = UIStoryboard(name: "\(nextView)Screen", bundle: nil)
        self.viewController = self.storyboard!.instantiateViewController(withIdentifier: "\(nextView)ViewController")
    }
}
