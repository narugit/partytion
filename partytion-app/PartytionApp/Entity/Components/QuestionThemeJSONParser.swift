//
//  QuestionThemeJSONParser.swift
//  PartytionApp
//
//  Created by tatsuya_oyanagi on 2019/10/05.
//  Copyright © 2019 naruhiyo. All rights reserved.
//
import UIKit

struct QuestionThemeJSONParser: JSONParser {
    // JSON を取得
    func getJSONData (resourceName: String) -> Codable {
        let path = self.load(resourceName: resourceName)
        let data = FileIO().getFileData(path)
        do {
            // import
            return try! JSONDecoder().decode(QuestionThemeEntity.self, from: data!)
        }
    }
}
