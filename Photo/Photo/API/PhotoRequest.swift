//
//  PhotoRequest.swift
//  Photo
//
//  Created by 성민주민주 on 2022/06/05.
//

import Foundation

struct GetKeywordPhotoRequest: Codable {
    var client_id = APIKeys.UnsplashAccessKey
    var query: String
    var page: String?
    var per_page: Int?
    var order_by: String?
}
