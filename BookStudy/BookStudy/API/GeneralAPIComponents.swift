//
//  GeneralAPIComponents.swift
//  BookStudy
//
//  Created by 성민주민주 on 2022/05/27.
//

import Foundation



enum APIKeyString: String {
    case NaverBookClientID = "NaverBook_ClientID"
    case NaverBookClientSecret = "NaverBook_ClientSecret"
}

enum APIHeader: String {
    case NaverClientID = "X-Naver-Client-Id"
    case NaverClientSecret = "X-Naver-Client-Secret"
}

struct APIKeys {
    static let NaverBookClientID = Bundle.main.NaverBookClientID
    static let NaverBookClientSecret = Bundle.main.NaverBookClientSecret
}

struct EndPoint {
    static let NaverBookURL = "https://openapi.naver.com/v1/search/book.json"
}
