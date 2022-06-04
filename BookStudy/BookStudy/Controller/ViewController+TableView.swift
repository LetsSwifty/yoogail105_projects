//
//  ViewController+TableView.swift
//  BookStudy
//
//  Created by 성민주민주 on 2022/05/27.
//

import UIKit
import Kingfisher


extension ViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.bookList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: BookTableViewCell.identifier, for: indexPath) as? BookTableViewCell else {
            return UITableViewCell()
        }
        
        cell.selectionStyle = .none
        let row = bookList[indexPath.row]
        let isbn = row.isbn
        // 리스트에 있는지 확인
        let book = self.books?.filter("isbn CONTAINS [c] '\(isbn)'")
        if book?.isEmpty == true {
            cell.isClicked = false
        } else {
            cell.isClicked = true
        }
        
        cell.configureCell(row: row)
        
        DispatchQueue.main.async {
            print("비동기 처리, \(row.title)")
            let url = URL(string: row.image)
            cell.image.kf.setImage(with: url)
        }
        
        // 액션이 발생했을 때 호출
        cell.likeButtonAction = {
            if cell.isClicked {
                // 책 리스트에 추가
                let book = UserBook(isbn: isbn, title: cell.titleLabel.text ?? "", subtitle: cell.subtitleLabel.text ?? "", image: row.image)
                try! self.localRealm.write {
                    self.localRealm.add(book)
                }
            }else{
                // 책 리스트에서 제거
                try! self.localRealm.write{
                    self.localRealm.delete(book!)
                }
            }
        }
        return cell
    }
    
}
