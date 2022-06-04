//
//  UnsplashAPI.swift
//  Photo
//
//  Created by 성민주민주 on 2022/06/05.
//

import Foundation
import Alamofire
import SwiftyJSON

class UnsplashAPI {
    static let shared = UnsplashAPI()
    
    func fetchPhoto(keyowrd: String, _ completion: @escaping (Photos?, Error?) -> Void) {
        let request = GetKeywordPhotoRequest(query: keyowrd)
        AF.request(EndPoint.unsplashURL,
                   method: .get,
                   parameters: request)
            .responseDecodable(of: Photos.self) { response in
                switch response.result {
                case .success(let value):
                    completion(value, nil)
                case .failure(let error):
                    completion(nil, error)
                }
            }
    }
}
