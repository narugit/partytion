//
//  Copyright © 2019 naruhiyo. All rights reserved.
//

import UIKit
import Lottie
import CoreData

class SplashPresenter: BasePresenter {
    var nextView: String = "HowTo"

    private let animationTag: String = "BeerBubbles"
    private var storyboard: UIStoryboard? = nil
    public private(set) var viewController: UIViewController? = nil
    
    init() {
        self.setNextViewController()
    }
    
    func showAnimation(panel: UIView) {
        let animationView = AnimationView(name: self.animationTag)
        animationView.animationSpeed = 0.9
        animationView.loopMode = LottieLoopMode.loop

        panel.addSubview(animationView)

        animationView.play()
    }
    
    func setNextViewController() -> Void {
        
        // 初回起動のみHow To画面への移行
        if(!UserDefaults.standard.bool(forKey: "isInitialLaunch")) {
            UserDefaults.standard.set(true, forKey: "isInitialLaunch")
        } else {
            // 2回目以降はプレイヤー数入力画面への移行
            nextView = "Player"
        }
        
        self.storyboard = UIStoryboard(name: "\(nextView)Screen", bundle: nil)
        self.viewController = self.storyboard!.instantiateViewController(withIdentifier: "\(nextView)ViewController")
    }
}
