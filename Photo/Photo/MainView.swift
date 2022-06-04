//
//  MainView.swift
//  Photo
//
//  Created by 성민주민주 on 2022/06/05.
//

import UIKit
import SnapKit

class MainView: UIView {
    let collectionView: UICollectionView = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.scrollDirection = .vertical
        flowLayout.minimumLineSpacing = 1
        flowLayout.minimumInteritemSpacing = 1
        let collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: flowLayout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.register(PhotoCollectionViewCell.self, forCellWithReuseIdentifier: PhotoCollectionViewCell.identifier)
        collectionView.contentInset = UIEdgeInsets(top: 4, left: 4, bottom: 4, right: 4)
        return collectionView
    }()
    
    let searchBar: UISearchBar = {
        let searchBar = UISearchBar()
        searchBar.placeholder = "검색"
        return searchBar
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        constraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    private func constraints() {
        addSubview(collectionView)
        collectionView.snp.makeConstraints {
            $0.edges.equalTo(self.safeAreaLayoutGuide)
        }
    }
}
    
