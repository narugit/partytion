//
//  ViewController.swift
//  partytion-app
//
//  Created by tatsuya_oyanagi on 2019/07/22.
//  Copyright © 2019 naruhiyo. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var labeltest :UILabel!
    @IBOutlet var buttonTest :UIButton!
    var count = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func sampleButtonTapped(_ sender : Any) {
        count += 1
        if(count%2 == 0){
            labeltest.text = "Swift Test"
        }
        else{
            labeltest?.text = "tapped ! hogehoge"
        }
    }
}

