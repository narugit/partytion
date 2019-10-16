//
//  RootViewController.swift
//  PartytionApp
//
//  Created by naru on 2019/10/16.
//  Copyright © 2019 naruhiyo. All rights reserved.
//

import UIKit

final internal class RootViewController: UIViewController {

    let wireframe: RootViewWireframe = RootViewWireframe()
    internal var sb: UIStoryboard? = nil

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Wireframeによる画面遷移
        self.sb = UIStoryboard(name: "SplashScreen", bundle: nil)
        let childViewController: UIViewController = self.sb!.instantiateViewController(withIdentifier: "SplashViewController")
        self.wireframe.transition(to: childViewController)
    }

}
