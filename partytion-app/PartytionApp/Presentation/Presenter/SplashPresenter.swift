//
//  SplashPresenter.swift
//  PartytionApp
//
//  Created by tatsuya_oyanagi on 2019/09/01.
//  Copyright © 2019 naruhiyo. All rights reserved.
//

import UIKit
import Lottie

class SplashPresenter: BasePresenter {
    var nextView: String { return "HowTo" }
    
    private let animationTag: String = "BeerBubbles"
    
    private var storyboard: UIStoryboard? = nil
    public private(set) var viewController: UIViewController? = nil
    
    init() {
        self.setNextViewController()
    }
    
    func showAnimation(panel: UIView) {
        let animationView = AnimationView(name: self.animationTag)
        animationView.frame = CGRect(
            x: 0,
            y: 0,
            width: panel.bounds.width,
            height: panel.bounds.height
        )
        animationView.center = panel.center
        animationView.contentMode = .scaleAspectFit
        animationView.animationSpeed = 1
        animationView.loopMode = LottieLoopMode.playOnce
        
        panel.addSubview(animationView)
        
        animationView.play()
    }
    
    func setNextViewController() -> Void {
        self.storyboard = UIStoryboard(name: "\(nextView)Screen", bundle: nil)
        self.viewController = self.storyboard!.instantiateViewController(withIdentifier: "\(nextView)ViewController")
    }
}
