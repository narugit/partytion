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

    private var presenter: SplashPresenter!
    
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
        Timer.scheduledTimer(timeInterval: 3.5,
                             target: self,
                             selector: #selector(self.moveNextScreen),
                             userInfo: nil,
                             repeats: false)

    }
    
    @objc private func moveNextScreen() {
        
        // 初回起動のみHow To画面への移行
        if(!UserDefaults.standard.bool(forKey: "isInitialLaunch")){
            UserDefaults.standard.set(true, forKey: "isInitialLaunch")
        }else{
            // 2回目以降はプレイヤー数入力画面への移行
            self.presenter.nextView = "Player"
        }
        
        self.presenter.setNextViewController()
        self.present(self.presenter.viewController!, animated: true, completion: nil)
    }
}
