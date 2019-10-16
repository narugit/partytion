//
//  RootViewWireframe.swift
//  PartytionApp
//
//  Created by naru on 2019/10/16.
//  Copyright © 2019 naruhiyo. All rights reserved.
//

import UIKit

internal protocol Wireframe {
    func transition(to viewController: UIViewController)
}

internal struct RootViewWireframe: Wireframe {

    func transition(to viewController: UIViewController) {
        let appDelegate: AppDelegate = UIApplication.shared.delegate as! AppDelegate
        let rootViewController: RootViewController = appDelegate.window!.rootViewController as! RootViewController
        
        if !rootViewController.children.isEmpty {
            rootViewController.children.forEach { (childViewController: UIViewController) in
                childViewController.willMove(toParent: nil)
                childViewController.view.removeFromSuperview()
                childViewController.removeFromParent()
            }

        }
        
        rootViewController.addChild(viewController)
        viewController.view.frame = UIScreen.main.bounds
        rootViewController.view.addSubview(viewController.view)
        viewController.didMove(toParent: viewController)
    }
}
