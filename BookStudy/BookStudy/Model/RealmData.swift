//
//  RealmData.swift
//  BookStudy
//
//  Created by 성민주민주 on 2022/05/27.
//

import Foundation
import RealmSwift


class UserBook: Object {
    @Persisted var isbn: String
    @Persisted var title: String
    @Persisted var subtitle: String
    @Persisted var image: String
    
    override static func primaryKey() -> String? {
        return "isbn"
    }
    
    convenience init(isbn: String, title: String, subtitle: String, image: String) {
        self.init()
        
        self.isbn = isbn
        self.title = title
        self.subtitle = subtitle
        self.image = image
    }
}
