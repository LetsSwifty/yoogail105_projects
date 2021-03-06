//
//  ViewController.swift
//  BookStudy
//
//  Created by 성민주민주 on 2022/05/08.
//

import UIKit
import RealmSwift
import Kingfisher

final class ViewController: UIViewController {

    private let mainView = MainView()
    
    let likeButtonClickedNotificationKey = "likeButtonClicekd"
    
    var bookList: [Book] = [] {
        didSet {
            self.mainView.tableView.reloadData()
        }
    }
    var localRealm = try! Realm()
    var books: Results<UserBook>?
    
    override func loadView() {
        self.view = mainView
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        mainView.tableView.reloadData()
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        print(#function)
        view.backgroundColor = .white
        getBooksData()
        mainView.tableView.delegate = self
        mainView.tableView.dataSource = self
        setNaviBar()
        addNotification()
        fetchHeartList()
    }

    func getBooksData() {
        let request = SearchBooksRequest(query: "programming", display: 100, start: 1, sort: "sim")
        BookAPIService.searchBooks(param: request) { result, error in
            guard let result = result else {
                return
            }

            self.bookList = result.items
            
        }
    }
    
    func downloadBookImages() {
        var imageViewList = [UIImageView].self
        for book in bookList {
            let url = URL(string: book.image)
            var imageView = UIImageView()
            imageView.kf.setImage(with: url)
        }
        
        
        
    }
    
    func fetchHeartList() {
        books = localRealm.objects(UserBook.self)
    }
    
    func setNaviBar() {
        let myPageButton = UIBarButtonItem(title: "MyBooks >", style: .plain, target: self, action: #selector(moveMyBooks))
        myPageButton.tintColor = .black
        self.navigationItem.rightBarButtonItem = myPageButton
    }

    @objc func moveMyBooks() {
        let vc = MyBooksViewController()
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
    func addNotification() {
        
    }
    
    @objc func likeButtonClicked() {
        
    }
}


