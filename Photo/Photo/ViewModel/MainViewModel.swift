//
//  MainViewModel.swift
//  Photo
//
//  Created by 성민주민주 on 2022/06/05.
//

import Foundation

class MainViewModel {
    var onErrorHandling: ((String) -> Void)?
    var ImageArray = [String]()
    
    func searchPhoto(keyword: String, _ completion: ((Result) -> Void)? = nil) {
        UnsplashAPI.shared.fetchPhoto(keyowrd: keyword) { [weak self] response, error in
            
            self?.ImageArray = []
            
            if let error = error {
                print("Error:", error)
                return
            }
            
            if let response = response {
                print("Shop Count: ", response.total)
                for photo in response.results {
                    self?.ImageArray.append(photo.urls.small)
                }
            }
            
            self!.onErrorHandling?("ok")
        }
    }
}
