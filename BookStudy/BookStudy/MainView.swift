//
//  MainView.swift
//  BookStudy
//
//  Created by 성민주민주 on 2022/05/08.
//

import UIKit
import SnapKit
import Then

class MainView: UIView {
    let tableView = UITableView().then {
        $0.rowHeight = UITableView.automaticDimension
        $0.backgroundColor = .yellow
        $0.register(BookTableViewCell.self, forCellReuseIdentifier: BookTableViewCell.identifier)
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        constraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        constraints()
    }
    
    func constraints() {
        addSubview(tableView)
        
        tableView.snp.makeConstraints {
            $0.edges.equalTo(self.safeAreaLayoutGuide)
        }
    }
}
