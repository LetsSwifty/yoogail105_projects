//
//  PhotoModel.swift
//  Photo
//
//  Created by 성민주민주 on 2022/06/05.
//

import Foundation

struct Photos: Codable {
    let total, totalPages: Int
    let results: [Result]

    enum CodingKeys: String, CodingKey {
        case total
        case totalPages = "total_pages"
        case results
    }
}

struct Result: Codable {
    let id: String
    let createdAt, updatedAt: Date
    let resultDescription: String?
    let urls: Urls

    enum CodingKeys: String, CodingKey {
        case id
        case createdAt = "created_at"
        case updatedAt = "updated_at"
        case resultDescription = "description"
        case urls
    }
}

struct Urls: Codable {
    let raw, full, regular, small: String
    let thumb, smallS3: String

    enum CodingKeys: String, CodingKey {
        case raw, full, regular, small, thumb
        case smallS3 = "small_s3"
    }
}
