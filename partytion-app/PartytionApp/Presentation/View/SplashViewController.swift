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

    private var presenter: SplashPresenter!
    private let timerInterval: Double = 3.5

    // プログラムの読み込みが完了
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter = SplashPresenter()
        presenter.showAnimation(panel: animationPanel)
    }

    // 画面生成が全て完了している
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        // タイマーで画面遷移
        //     - 3.5秒を設定
        Timer.scheduledTimer(
            timeInterval: timerInterval,
            target: self,
            selector: #selector(self.moveNextScreen),
            userInfo: nil,
            repeats: false
        )
    }
    
    @objc private func moveNextScreen() {
        // 質問作成画面への移行
        self.present(presenter.viewController!,
                     animated: true,
                     completion: nil
        )
    }
}
