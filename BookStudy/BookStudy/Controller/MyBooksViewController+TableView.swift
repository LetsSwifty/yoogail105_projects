//
//  MyBooksViewController+TableView.swift
//  BookStudy
//
//  Created by 성민주민주 on 2022/05/27.
//

import UIKit
import Kingfisher


extension MyBooksViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.myBooks?.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: BookTableViewCell.identifier, for: indexPath) as? BookTableViewCell else {
            return UITableViewCell()
        }
        
        
        cell.selectionStyle = .none
        guard let myBooks = myBooks else {
            return cell
        }
        let row = myBooks[indexPath.row]
        
        let isbn = row.isbn
        cell.configureMyBookCell(row: row)
        let url = URL(string: row.image)
        cell.image.kf.setImage(with: url)
        cell.likeButtonAction = {
            if cell.isClicked {
                let book = self.localRealm.objects(UserBook.self).filter("isbn == isbn")
                try! self.localRealm.write{
                    self.localRealm.delete(book)
                }
            }
    }
    return cell
}

}
