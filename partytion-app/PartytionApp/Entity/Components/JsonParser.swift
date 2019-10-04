//
//  JsonParser.swift
//  PartytionApp
//
//  Created by tatsuya_oyanagi on 2019/10/04.
//  Copyright © 2019 naruhiyo. All rights reserved.
//
import UIKit
import Foundation

class JsonParser {
    // JSON を取得
    func getJSONData(resourceName: String) -> Any {
        do {
            // parse
            let path = Bundle.main.path(forResource: resourceName, ofType: "json")
            let url = URL(fileURLWithPath: path!)

            // data生成
            let data = try? Data(contentsOf: url)
            return try? JSONDecoder().decode(QuestionThemeEntity.self, from: data!)
        } catch let error {
            print("Error: \(error.localizedDescription)")
        }
    }
}

