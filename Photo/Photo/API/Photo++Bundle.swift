//
//  Photo++Bundel.swift
//  Photo
//
//  Created by 성민주민주 on 2022/06/05.
//

import Foundation
let resource = "APIKeysInfo"

extension Bundle {
    var UnsplashAccessKey: String {
        guard let file = self.path(forResource: resource, ofType: "plist") else {return ""}
        guard let resource = NSDictionary(contentsOfFile: file) else { return "" }
        guard let key = resource[APIKeyString.UnsplashAccessKey.rawValue] as? String else { fatalError(APIKeyString.UnsplashAccessKey.rawValue + "error")}
        return key
    }
}
