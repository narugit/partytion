//
//  Copyright © 2019 naruhiyo. All rights reserved.
//

import UIKit
import Lottie
import CoreData

class SplashPresenter: BasePresenter {
    public var nextView: String = "HowTo"
    private var storyboard: UIStoryboard? = nil
    public private(set) var viewController: UIViewController? = nil
    
    init() {
        self.setNextViewController()
    }
    
    func showAnimation(panel: UIView) {
        let animationView = AnimationView(name: self.animationTag)
        animationView.animationSpeed = 0.9
        animationView.loopMode = LottieLoopMode.loop

        animationPanel.addSubview(animationView)

        animationView.play()
    }
    
    func setNextViewController() -> Void {
        self.storyboard = UIStoryboard(name: "\(nextView)Screen", bundle: nil)
        self.viewController = self.storyboard!.instantiateViewController(withIdentifier: "\(nextView)ViewController")
    }
}
