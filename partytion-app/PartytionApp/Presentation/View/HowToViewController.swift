//
//  HowToViewController.swift
//  PartytionApp
//
//  Created by naru on 2019/08/06.
//  Copyright © 2019 naruhiyo. All rights reserved.
//

import UIKit
import SSBouncyButton

class HowToViewController: UIViewController {
    @IBOutlet var contentLabel: UILabel! = UILabel(frame: .zero)
    @IBOutlet weak var nextButton: SSBouncyButton!
    @IBOutlet weak var backButton: SSBouncyButton!
    
    var pages: [String]! = [
        "1. プレイヤー数を入力します。",
        "2.プレイヤー数がランダムに2分されます。\n2分された比率になるような質問文を考えてみてください！",
        "3. スマホを一人づつ回していって、\n回答してください。",
        "4. 結果発表！\n提示された比率になっていましたか？"
    ]

    var page: Int! = 0
    private var presenter: HowToPresenter!
    private let wireframe: RootViewWireframe = RootViewWireframe()
    
    // プログラムの読み込みが完了
    override func viewDidLoad() {
        super.viewDidLoad()
        self.presenter = HowToPresenter()
        self.backButton.isHidden = true
    }
    
    // nextボタンをタップ
    @IBAction func nextButtonTapped(_ sender: Any) {
        page += 1
        
        if(page > 0){
            backButton.isHidden = false
        }
        
        if(self.page > self.pages.count - 1){
            self.page = self.pages.count - 1
            // ページ遷移する
            self.movePlayerScreen()
        }
        
        contentLabel.text = self.pages[self.page]
    }
    
    // backボタンをタップ
    // 1ページ目はbackボタンが表示されない
    @IBAction func backButtonTapped(_ sender: Any) {
        page -= 1
        
        if(page <= 0){
            page = 0
            backButton.isHidden = true
        }
        
        contentLabel.text = self.pages[self.page]
    }
    
    // プレイヤー画面への移行
    private func movePlayerScreen() {
        self.wireframe.transition(to: self.presenter.viewController!)
    }
}
