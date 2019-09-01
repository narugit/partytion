//
//  QuestionPresenter.swift
//  PartytionApp
//
//  Created by naru on 2019/09/01.
//  Copyright © 2019 naruhiyo. All rights reserved.
//

import UIKit
import CoreData

class SplashPresenter: BasePresenter {
    public var nextView: String = "HowTo"
    private var storyboard: UIStoryboard? = nil
    public private(set) var viewController: UIViewController? = nil
    
    init() {
    }
    
    func setNextViewController() -> Void {
        self.storyboard = UIStoryboard(name: "\(nextView)Screen", bundle: nil)
        self.viewController = self.storyboard!.instantiateViewController(withIdentifier: "\(nextView)ViewController")
    }
    
    
}
