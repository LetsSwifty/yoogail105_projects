//
//  BookAPI.swift
//  BookStudy
//
//  Created by 성민주민주 on 2022/05/27.
//

import Foundation
import Moya

final class BookAPIService {
    static private let provider = MoyaProvider<BookService>()
    
    static func searchBooks(param: SearchBooksRequest, completion: @escaping (Books?, Error?) -> Void) {
        
        provider.request(.searchBooks(param: param)) { result in
            
            switch result {
            case let .success(response):
                let book = try? JSONDecoder().decode(Books.self, from: response.data)
                return completion(book,nil)

            case .failure(_):
                print("error")
                return completion(nil, nil) // 처리해야함
            }
            
        }
    }
    
}
