//
//  QuestionThemeJSONParser.swift
//  PartytionApp
//
//  Created by tatsuya_oyanagi on 2019/10/05.
//  Copyright © 2019 naruhiyo. All rights reserved.
//
import UIKit

struct QuestionThemeJSONParser: JSONParser {
    private let resourceName = "SeedData"

    // JSON を取得
    func getJSONData () -> Codable {
        let path = self.load(resourceName: resourceName)
        let data = FileIO().getFileData(path)
        do {
            // import
            return try! JSONDecoder().decode(QuestionThemeEntity.self, from: data!)
        }
    }
}
