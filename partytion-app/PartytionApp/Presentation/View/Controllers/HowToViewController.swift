//
//  HowToViewController.swift
//  PartytionApp
//
//  Created by naru on 2019/08/06.
//  Copyright © 2019 naruhiyo. All rights reserved.
//

import UIKit
import SSBouncyButton
import SwiftyGif

class HowToViewController: UIViewController {
    
    @IBOutlet var contentLabel: UILabel! = UILabel(frame: .zero)
    @IBOutlet var contentText: UITextView!
    @IBOutlet var contentImage: UIImageView!
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
        
        // スワイプを有効にする
        let rightGesture: UISwipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(self.handleRight))
        rightGesture.numberOfTouchesRequired = 1  // number of fingers
        rightGesture.direction = UISwipeGestureRecognizer.Direction.right

        let leftGesture: UISwipeGestureRecognizer = UISwipeGestureRecognizer(target: self, action: #selector(self.handleLeft))
        leftGesture.numberOfTouchesRequired = 1  // number of fingers
        leftGesture.direction = UISwipeGestureRecognizer.Direction.left
    
        self.view.addGestureRecognizer(rightGesture)
        self.view.addGestureRecognizer(leftGesture)
    }
    
    // スワイプの検知
    // right
    @objc private func handleRight () {
        self.currentIndex -= 1
        self.movePage()
    }
    // left
    @objc private func handleLeft () {
        self.currentIndex += 1
        self.movePage()
    }
    
    // nextボタンをタップ
    @IBAction func nextButtonTapped(_ sender: Any) {
        self.currentIndex += 1
        self.movePage()
    }
    
    // ページスキップ
    @IBAction func skipButtonTapped(_ sender: Any) {
        self.movePlayerScreen()
    }
    
    // プレイヤー画面への移行
    private func movePlayerScreen() {
        self.wireframe.transition(to: self.presenter.viewController!)
    }
    
    // How to ページの移動
    private func movePage() {
        if(self.currentIndex < 0) {
            self.currentIndex = 0
        }
        
        if(self.currentIndex > self.presenter.getPageCount() - 1){
            // ページ遷移する
            return self.movePlayerScreen()
        }

        self.presenter.setPageIndex(index: self.currentIndex)
        self.walkThroughPageControl.currentPage = self.currentIndex
        self.displayPageContent()
    }
    
    // コンテンツのセット
    private func displayPageContent() {
        do {
            let contents: [String] = self.presenter.getPageContent()
            contentLabel.text = contents[0]
            contentText.text = contents[1]
            let gif = try UIImage.init(gifName: contents[2])
            contentImage.setGifImage(gif)
        } catch {
            print(error)
        }
    }
}
