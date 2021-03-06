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
            print("update Mybookslist: ", myBooks)
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
        setNaviBar()
    
    }
    
    func fetchHeartList() {
        myBooks = localRealm.objects(UserBook.self)
    }
    
    func setNaviBar() {
        let backButton = UIBarButtonItem(title: "< Books ", style: .plain, target: self, action: #selector(moveBack))
        backButton.tintColor = .black
        self.navigationItem.leftBarButtonItem = backButton
    }
    
    @objc func moveBack() {
        navigationController?.popViewController(animated: true)
    }
}
