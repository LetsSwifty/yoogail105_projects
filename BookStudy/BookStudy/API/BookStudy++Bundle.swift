//
//  BookStudy++Bundle.swift
//  BookStudy
//
//  Created by 성민주민주 on 2022/05/27.
//

import Foundation

let resource = "APIKeysInfo"

extension Bundle {
    var NaverBookClientID: String {
        guard let file = self.path(forResource: resource, ofType: "plist") else {return ""}
        guard let resource = NSDictionary(contentsOfFile: file) else { return "" }
        guard let key = resource[APIKeyString.NaverBookClientID.rawValue] as? String else { fatalError(APIKeyString.NaverBookClientID.rawValue + APIErrorMessage.KeyFatalError.rawValue)}
        return key
    }
    
    var NaverBookClientSecret: String {
        guard let file = self.path(forResource: resource, ofType: "plist") else {return ""}
        guard let resource = NSDictionary(contentsOfFile: file) else { return "" }
        guard let key = resource[APIKeyString.NaverBookClientSecret.rawValue] as? String else { fatalError(APIKeyString.NaverBookClientSecret.rawValue + APIErrorMessage.KeyFatalError.rawValue)}
        return key
    }
}

