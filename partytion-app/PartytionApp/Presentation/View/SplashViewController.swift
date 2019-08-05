//
//  ViewController.swift
//  PartytionApp
//
//  Created by tatsuya_oyanagi on 2019/08/05.
//  Copyright © 2019 naruhiyo. All rights reserved.
//

import UIKit
import Lottie


class SplashViewController: UIViewController {
    var logoImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        self.view.backgroundColor = UIColor.blue
        
        showAnimation()
        //imageView作成
//        self.logoImageView = UIImageView(frame: CGRectMake(0, 0, 204, 77))
//        //画面centerに
//        self.logoImageView.center = self.view.center
//        //logo設定
//        self.logoImageView.image = UIImage(named: "logo")
//        //viewに追加
//        self.view.addSubview(self.logoImageView)
        
    }
    
    func showAnimation() {
        let animationView = AnimationView(name: "BeerBubbles")
        animationView.frame = CGRect(x: 0, y: 0, width: view.bounds.width, height: view.bounds.height)
        animationView.center = self.view.center
        animationView.contentMode = .scaleAspectFit
        animationView.animationSpeed = 1
        
        view.addSubview(animationView)
        
        animationView.play()
    }

}
