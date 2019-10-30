//
//  HowToPresenter.swift
//  PartytionApp
//
//  Created by tatsuya_oyanagi on 2019/09/01.
//  Copyright © 2019 naruhiyo. All rights reserved.
//

import UIKit

class HowToPresenter: BasePresenter {
    var nextView: String { return "Player" }
        
    private var storyboard: UIStoryboard? = nil
    public private(set) var viewController: UIViewController? = nil
    
    // Page Manager
    private var pageIndex: Int! = 0
    private var pageHeader: [String] = [
        "人数の入力",
        "質問文の作成",
        "回答",
        "結果発表"
    ]
    private var pageContent: [String]! = [
        "プレイヤー数を入力します。",
        "プレイヤー数がランダムに2分されます。\n2分された比率になるような質問文を考えてみてください！",
        "スマホを一人づつ回していって、\n回答してください。",
        "結果発表！\n提示された比率になっていましたか？"
    ]
    private var pageImage: [String] = [
        "sample.gif",
        "sample.gif",
        "sample.gif",
        "sample.gif"
    ]
    
    init() {
        self.setNextViewController()
    }
    
    func setPageIndex(index: Int) -> Void {
        self.pageIndex = index
    }
    
    func getPageCount() -> Int {
        return self.pageHeader.count
    }
    
    // ページ情報の取得
    func getPageContent() -> [ String ] {
        return [
            self.pageHeader[self.pageIndex],
            self.pageContent[self.pageIndex],
            self.pageImage[self.pageIndex]
        ]
    }
    
    func setNextViewController() -> Void {
        self.storyboard = UIStoryboard(name: "\(nextView)Screen", bundle: nil)
        self.viewController = self.storyboard!.instantiateViewController(withIdentifier: "\(nextView)ViewController")
    }
}
