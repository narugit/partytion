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
    
    init() {
        self.setNextViewController()
    }
    
    func setNextViewController() -> Void {
        self.storyboard = UIStoryboard(name: "\(nextView)Screen", bundle: nil)
        self.viewController = self.storyboard!.instantiateViewController(withIdentifier: "\(nextView)ViewController")
    }
}
