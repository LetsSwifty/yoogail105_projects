//
//  APIService.swift
//  BookStudy
//
//  Created by 성민주민주 on 2022/05/27.
//

import Foundation
import Moya

enum BookService {
    case searchBooks(param: SearchBooksRequest)
}


extension BookService: TargetType {
    var baseURL: URL {
        return URL(string: EndPoint.NaverBookURL)!
    }
    
    var path: String {
        switch self {
        case .searchBooks:
            return ""
        }
    }
    
    var method: Moya.Method {
        switch self {
        case .searchBooks:
            return .get
        }
    }
    
    var task: Task {
        switch self {
        case .searchBooks(let param):
            return .requestParameters(parameters: [
                "query": param.query,
                "display": param.display,
                "start": param.start,
                "sort": param.sort
            ], encoding: URLEncoding.default)
        }
    }
    
    var headers: [String : String]? {
        switch self {
        case .searchBooks:
            return [APIHeader.NaverClientID.rawValue : APIKeys.NaverBookClientID,
                    APIHeader.NaverClientSecret.rawValue : APIKeys.NaverBookClientSecret]
        }
    }
    
  
}
