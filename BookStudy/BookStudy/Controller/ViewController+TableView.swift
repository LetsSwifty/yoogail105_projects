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
        cell.configureCell(row: row)
        
        cell.likeButtonAction = {
            print("clicked")
            cell.likeButton.setImage(UIImage(systemName: "heart.fill"), for: .normal)
        }
        return cell
    }
    
    
}
