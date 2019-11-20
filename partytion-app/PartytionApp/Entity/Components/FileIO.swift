//
//  FileIO.swift
//  PartytionApp
//
//  Created by tatsuya_oyanagi on 2019/10/05.
//  Copyright © 2019 naruhiyo. All rights reserved.
//

import Foundation

protocol BaseIO {
    func getFileData(_ filePath: String) -> Data?
}

struct FileIO: BaseIO {
    /**
        Import File
        @params path
        @return: File
     */
    func getFileData(_ filePath: String) -> Data? {
        let fileData: Data?
        do {
            let fileUrl = URL(fileURLWithPath: filePath)
            fileData = try Data(contentsOf: fileUrl)
        } catch {
            // ファイルデータの取得でエラーの場合
            fileData = nil
        }
        return fileData
    }
}
