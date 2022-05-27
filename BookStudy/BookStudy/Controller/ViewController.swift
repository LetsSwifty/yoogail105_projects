//
//  ViewController.swift
//  BookStudy
//
//  Created by 성민주민주 on 2022/05/08.
//

import UIKit

final class ViewController: UIViewController {

    private let mainView = MainView()
    let likeButtonClickedNotificationKey = "likeButtonClicekd"
    
    override func loadView() {
        self.view = mainView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        mainView.tableView.delegate = self
        mainView.tableView.dataSource = self
        setNaviBar()
        addNotification()
        getBooksData()

    }

    func getBooksData() {
        let request = SearchBooksRequest(query: "swift", display: 10, start: 1, sort: "sim")
        BookAPIService.searchBooks(param: request) { result, error in
            guard let result = result else {
                return
            }

            print(result.items[0].title)
        }
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

extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: BookTableViewCell.identifier, for: indexPath) as? BookTableViewCell else {
            return UITableViewCell()
        }
        cell.selectionStyle = .none
        cell.likeButtonAction = {
            print("clicked")
            cell.likeButton.setImage(UIImage(systemName: "heart.fill"), for: .normal)
        }
        return cell
    }
    
    
}
