//
//  GeneralAPIComponents.swift
//  Photo
//
//  Created by 성민주민주 on 2022/06/05.
//

import Foundation

enum APIKeyString: String {
    case UnsplashAccessKey = "UnsplashAccessKey"
}

struct APIKeys {
    static let UnsplashAccessKey = Bundle.main.UnsplashAccessKey
}

struct EndPoint {
    static let unsplashURL = "https://api.unsplash.com/"
}
