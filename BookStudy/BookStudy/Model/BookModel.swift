//
//  BookModel.swift
//  BookStudy
//
//  Created by 성민주민주 on 2022/05/08.
//

import Foundation


struct Books: Codable {
    let lastBuildDate: String
    let total, start, display: Int
    let items: [Book]
}

// MARK: - Item
struct Book: Codable {
    let title: String
    let link: String
    let image: String
    let author, price, discount, publisher: String
    let pubdate, isbn, itemDescription: String

    enum CodingKeys: String, CodingKey {
        case title, link, image, author, price, discount, publisher, pubdate, isbn
        case itemDescription = "description"
    }
}
