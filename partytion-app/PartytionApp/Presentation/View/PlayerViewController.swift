//
//  PlayerViewController.swift
//  PartytionApp
//
//  Created by naru on 2019/08/06.
//  Copyright © 2019 naruhiyo. All rights reserved.
//

import UIKit
import GMStepper
import BubbleTransition
import SSBouncyButton

class PlayerViewController: UIViewController {
    @IBOutlet weak var inputPlayerNumber: GMStepper!
    @IBOutlet weak var nextButton: SSBouncyButton!
    
    // プログラムの読み込みが完了
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    let transition = BubbleTransition()
    
    public override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let controller = segue.destination
        controller.transitioningDelegate = self as! UIViewControllerTransitioningDelegate
        controller.modalPresentationStyle = .custom
    }
    
    // MARK: UIViewControllerTransitioningDelegate
    
    public func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transition.transitionMode = .present
        transition.startingPoint = nextButton.center
        transition.bubbleColor = nextButton.backgroundColor!
        return transition
    }
    
    public func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        transition.transitionMode = .dismiss
        transition.startingPoint = nextButton.center
        transition.bubbleColor = nextButton.backgroundColor!
        return transition
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
