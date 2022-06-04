//
//  ViewController.swift
//  Photo
//
//  Created by 성민주민주 on 2022/06/05.
//

import UIKit
import Kingfisher

class MainViewController: UIViewController {
    
    let mainView = MainView()
    let viewModel = MainViewModel()
    override func loadView() {
        self.view = mainView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        setupNavigationBar()
        setupCollectionView()
        setupSearchBar()
        loadImages(keyword: "sky")
    }
    
    func setupNavigationBar() {
        self.navigationItem.titleView = mainView.searchBar
    }
    
    func setupCollectionView() {
        let collectionView = mainView.collectionView
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.keyboardDismissMode = .onDrag
    }
    
    func setupSearchBar() {
        mainView.searchBar.delegate = self
    }
    
    func loadImages(keyword: String) {
        viewModel.searchPhoto(keyword: keyword)
        viewModel.onErrorHandling = { result in
            if result == "ok" {
                self.mainView.collectionView.reloadData()
            }
        }
    }
    
    
}

extension MainViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return viewModel.ImageArray.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: PhotoCollectionViewCell.identifier, for: indexPath) as? PhotoCollectionViewCell else { return UICollectionViewCell() }

        let item = viewModel.ImageArray[indexPath.item]
        let url = URL(string: item)
        cell.photoView.kf.setImage(with: url)
        
        return cell
    }
}

extension MainViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let size = UIScreen.main.bounds.width / 3 - 4
        return CGSize(width: size, height: size)
    }
}

extension MainViewController: UISearchBarDelegate {
    private func dismissKeyboard() {
        mainView.searchBar.resignFirstResponder()
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        dismissKeyboard()
        
        guard let keyword = mainView.searchBar.text, keyword.isEmpty == false else {
            return
        }
        
        self.loadImages(keyword: keyword)
    }
}


