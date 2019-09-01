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

    // プログラムの読み込みが完了
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter = SplashPresenter()
        presenter.showAnimation(panel: animationPanel)
    }

    // 画面生成が全て完了している
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        presenter.setMoveViewTimer()
    }
}
