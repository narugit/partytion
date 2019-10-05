//
//  JsonParser.swift
//  PartytionApp
//
//  Created by tatsuya_oyanagi on 2019/10/04.
//  Copyright © 2019 naruhiyo. All rights reserved.
//
import UIKit

protocol JSONParser {
    func getJSONData (resourceName: String) -> Codable
}

extension JSONParser {
    func load (resourceName: String) -> String {
        // parse
        return Bundle.main.path(forResource: resourceName, ofType:"json")!
    }
}
