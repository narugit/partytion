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
    @IBOutlet var contentText: UITextView!
    @IBOutlet var nextButton: SSBouncyButton!
    @IBOutlet var skipButton: SSBouncyButton!
    
    @IBOutlet var walkThroughPageControl: UIPageControl!

    private var presenter: HowToPresenter!
    private let wireframe: RootViewWireframe = RootViewWireframe()
    private var currentIndex: Int = 0
    
    // プログラムの読み込みが完了
    override func viewDidLoad() {
        super.viewDidLoad()
        self.presenter = HowToPresenter()
        self.presenter.setPageIndex(index: self.currentIndex)

        self.walkThroughPageControl.numberOfPages = self.presenter.getPageCount()
        self.displayPageContent()
    }
    
    // nextボタンをタップ
    @IBAction func nextButtonTapped(_ sender: Any) {
        self.currentIndex += 1
        self.presenter.setPageIndex(index: self.currentIndex)
        self.walkThroughPageControl.currentPage = self.currentIndex

        if(self.currentIndex > self.presenter.getPageCount() - 1){
            // ページ遷移する
            return self.movePlayerScreen()
        }

        self.displayPageContent()
    }
    
    @IBAction func skipButtonTapped(_ sender: Any) {
        self.movePlayerScreen()
    }
    
    // プレイヤー画面への移行
    private func movePlayerScreen() {
        self.wireframe.transition(to: self.presenter.viewController!)
    }
    
    // コンテンツのセット
    private func displayPageContent() {
        let contents: [String] = self.presenter.getPageContent()
        contentLabel.text = contents[0]
        contentText.text = contents[1]
    }
}
