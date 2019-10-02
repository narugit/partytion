//
//  ViewController.swift
//  PartytionApp
//
//  Created by tatsuya_oyanagi on 2019/08/05.
//  Copyright © 2019 naruhiyo. All rights reserved.
//

import UIKit

class SplashViewController: UIViewController {
    @IBOutlet var animationPanel :UIView!

    private var presenter: SplashPresenter!
    private let timerInterval: Double = 3.5
    
    // プログラムの読み込みが完了
    override func viewDidLoad() {
        super.viewDidLoad()
        self.presenter = SplashPresenter()
        self.presenter.showAnimation(panel: animationPanel)
    }

    // 画面生成が全て完了している
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        // タイマーで画面遷移
        //     - 3.5秒を設定
        Timer.scheduledTimer(timeInterval: 3.5,
                             target: self,
                             selector: #selector(self.moveNextScreen),
                             userInfo: nil,
                             repeats: false)

    }
    
    @objc private func moveNextScreen() {
        self.presenter.setNextViewController()
        self.present(self.presenter.viewController!, animated: true, completion: nil)
    }
}
