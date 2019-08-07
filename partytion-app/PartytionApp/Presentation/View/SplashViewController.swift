//
//  ViewController.swift
//  PartytionApp
//
//  Created by tatsuya_oyanagi on 2019/08/05.
//  Copyright © 2019 naruhiyo. All rights reserved.
//

import UIKit
import Lottie

class SplashViewController: UIViewController {
    @IBOutlet var animationPanel :UIView!
    var timer : Timer?

    // プログラムの読み込みが完了
    override func viewDidLoad() {
        super.viewDidLoad()
        showAnimation()
    }

    // 画面生成が全て完了している
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        // タイマーで画面遷移
        //     - 3.5秒を設定
        Timer.scheduledTimer(timeInterval: 3.5,
                             target: self,
                             selector: #selector(self.moveHowToScreen),
                             userInfo: nil,
                             repeats: false)

    }
    
    // How To画面への移行
    @objc private func moveHowToScreen() {
        let howToStoryboard :UIStoryboard = UIStoryboard(name: "HowToScreen", bundle: nil)
        let howToScreen :UIViewController = howToStoryboard.instantiateViewController(withIdentifier: "HowToViewController")
        present(howToScreen, animated: true, completion: nil)
    }
    
    private func showAnimation() {
        let animationView = AnimationView(name: "BeerBubbles")
        animationView.frame = CGRect(x: 0, y: 0, width: animationPanel.bounds.width, height: animationPanel.bounds.height)
        animationView.center = animationPanel.center
        animationView.contentMode = .scaleAspectFit
        animationView.animationSpeed = 1
        animationView.loopMode = LottieLoopMode.playOnce

        animationPanel.addSubview(animationView)

        animationView.play()
    }

}