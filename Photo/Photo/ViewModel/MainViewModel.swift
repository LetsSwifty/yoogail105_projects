//
//  MainViewModel.swift
//  Photo
//
//  Created by 성민주민주 on 2022/06/05.
//

import Foundation

class MainViewModel {
    func searchPhoto(keyword: String) {
        UnsplashAPI.shared.fetchPhoto(keyowrd: "green") { [weak self] response, error in
            
            if let error = error {
                print("Error:", error)
                return
            }
            
            if let response = response {
                print("Shop Count: ", response.total)
                for photo in response.results {
                    print(photo.id)
                }
            }
        }
    }
}
