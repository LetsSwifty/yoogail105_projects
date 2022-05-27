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
        cell.configureCell(row: row)
        let url = URL(string: row.image)
        cell.image.kf.setImage(with: url)
        cell.likeButtonAction = {
            print("clicked")
            
            
            if cell.isClicked {
                cell.likeButton.setImage(UIImage(systemName: "heart.fill"), for: .normal)
                let book = UserBook(isbn: isbn, title: row.title, subtitle: row.itemDescription, image: row.image)
                try! self.localRealm.write {
                    self.localRealm.add(book)
                }
            }else{
                cell.likeButton.setImage(UIImage(systemName: "heart"), for: .normal)
                let book = self.localRealm.objects(UserBook.self).filter("isbn == isbn")
                try! self.localRealm.write{
                    self.localRealm.delete(book)
                }
            }
    }
    return cell
}

}
