//
//  PlayerViewController.swift
//  PartytionApp
//
//  Created by naru on 2019/08/06.
//  Copyright © 2019 naruhiyo. All rights reserved.
//

import UIKit

class PlayerViewController: UIViewController {
    @IBOutlet var inputPlayerNumber: UITextField!
    @IBOutlet var nextButton: UIButton!
    
    private var presenter: PlayerPresenter!

    // プログラムの読み込みが完了
    override func viewDidLoad() {
        super.viewDidLoad()

        self.presenter = PlayerPresenter()
        self.inputPlayerNumber.keyboardType = UIKeyboardType.numberPad
    }
    
    @IBAction func nextButtonTapped(_ sender: Any) {
        presenter.setPlayerNumber(playerNumber: inputPlayerNumber.text)
        self.moveQuestionScreen()
    }
    // 質問作成画面への移行
    private func moveQuestionScreen() {
        present(
            presenter.viewController!,
            animated: true,
            completion: nil
        )
    }    
}
