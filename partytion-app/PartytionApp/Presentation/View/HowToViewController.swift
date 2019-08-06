//
//  HowToViewController.swift
//  PartytionApp
//
//  Created by naru on 2019/08/06.
//  Copyright © 2019 naruhiyo. All rights reserved.
//

import UIKit

class HowToViewController: UIViewController {
    @IBOutlet var nextButton: UIButton!
    @IBOutlet var backButton: UIButton!
    @IBOutlet var contentLabel: UILabel!
    
    var content: [String]! = ["Explanation 1", "Explanation 2", "Explanation 3", "Explanation 4"]
    var page: Int! = 0
    var pageNum: Int!
    
    // プログラムの読み込みが完了
    override func viewDidLoad() {
        super.viewDidLoad()
        backButton.isHidden = true
        self.pageNum = self.content.count
    }
    
    // nextボタンをタップ
    @IBAction func nextButtonTapped(_ sender: Any) {
        page += 1
        
        if(page > 0){
            backButton.isHidden = false
        }
        
        if(self.page > self.pageNum - 1){
            self.page = self.pageNum - 1
            // ページ遷移する
            self.movePlayerScreen()
        }
        
        contentLabel.text = self.content[self.page]
    }
    
    // backボタンをタップ
    // 1ページ目はbackボタンが表示されない
    @IBAction func backButtonTapped(_ sender: Any) {
        page -= 1
        
        if(page <= 0){
            page = 0
            backButton.isHidden = true
        }
        
        contentLabel.text = self.content[self.page]
    }
    
    // プレイヤー画面への移行
    private func movePlayerScreen() {
        let playerStoryboard :UIStoryboard = UIStoryboard(name: "PlayerScreen", bundle: nil)
        let playerScreen :UIViewController = playerStoryboard.instantiateViewController(withIdentifier: "PlayerViewController")
        present(playerScreen, animated: true, completion: nil)
    }
}
