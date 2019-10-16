//
//  PlayerViewController.swift
//  PartytionApp
//
//  Created by naru on 2019/08/06.
//  Copyright © 2019 naruhiyo. All rights reserved.
//

import UIKit
import GMStepper
import SSBouncyButton

class PlayerViewController: UIViewController {
    @IBOutlet weak var inputPlayerNumber: GMStepper!
    @IBOutlet weak var nextButton: SSBouncyButton!

    private var presenter: PlayerPresenter!
    private let wireframe: RootViewWireframe = RootViewWireframe()
    
    // プログラムの読み込みが完了
    override func viewDidLoad() {
        super.viewDidLoad()
        self.presenter = PlayerPresenter()
//        self.window!.rootViewController = self.storyboard!.instantiateViewController(withIdentifier: "PlayerViewController")
    }
    
    @IBAction func nextButtonTapped(_ sender: Any) {
        presenter.setPlayerNumber(playerNumber: inputPlayerNumber?.value)
        self.moveQuestionScreen()
    }
    
    // 質問作成画面への移行
    private func moveQuestionScreen() {
        self.wireframe.transition(to: self.presenter.viewController!)
    }
}
