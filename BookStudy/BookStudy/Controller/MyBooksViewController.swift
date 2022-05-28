//
//  MyBooksViewController.swift
//  BookStudy
//
//  Created by 성민주민주 on 2022/05/08.
//

import UIKit
import RealmSwift

class MyBooksViewController: UIViewController {
    private let mainView = MainView()
    
    var localRealm = try! Realm()
    var myBooks: Results<UserBook>? {
        didSet {
            mainView.tableView.reloadData()
        }
    }
    
    override func loadView() {
        self.view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mainView.tableView.delegate = self
        mainView.tableView.dataSource = self
        fetchHeartList()
    
    }
    
    func fetchHeartList() {
        myBooks = localRealm.objects(UserBook.self)
    }
    
}
