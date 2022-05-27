//
//  BookRequest.swift
//  BookStudy
//
//  Created by 성민주민주 on 2022/05/27.
//

import Foundation

struct SearchBooksRequest {
    var query: String
    var display: Int
    var start: Int
    var sort: String
}
