//
//  BookTableViewCell.swift
//  BookStudy
//
//  Created by 성민주민주 on 2022/05/08.
//

import UIKit
import SwiftUI
typealias EmptyClosure = (() -> ())

final class BookTableViewCell: UITableViewCell {
    static let identifier = "BookTableViewCell"
    
    var likeButtonAction : EmptyClosure = {}
    var isClicked = false {
        didSet {
            if isClicked {
                likeButton.setImage(UIImage(systemName: "heart.fill"), for: .normal)
            } else {
                likeButton.setImage(UIImage(systemName: "heart"), for: .normal)
            }
        }
    }
    
    let image = UIImageView().then {
        $0.image = UIImage(systemName: "book")
        $0.layer.cornerRadius = 8
        $0.contentMode = .scaleAspectFill
        $0.clipsToBounds = true
        $0.layer.borderWidth = 2
        $0.layer.borderColor = UIColor.lightGray.cgColor
        $0.backgroundColor = .lightGray
    }
    
    let titleLabel = UILabel().then {
        $0.text = "도서제목"
        $0.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        $0.numberOfLines = 1
    }
    
    let subtitleLabel = UILabel().then {
        $0.text = "도서 설명도서 설명도서 설명도서 설명도서 설명도서 설명도서 설명도서 설명도서 설명도서 설명도서 설명도서 설명도서 설명도서 설명도서 설명도서 설명도서 설명도서 설명도서 설명도서 설명도서 설명도서 설명도서 설명도서 설명도서 설명도서 설명도서 설명도서 설명도서 설명도서 설명도서 설명도서 설명도서 설명도서 설명도서 설명도서 설명도서 설명도서 설명도서 설명도서 설명도서 설명도서 설명도서 설명도서 설명도서 설명도서 설명도서 설명도서 설명도서 설명도서 설명도서 설명도서 설명도서 설명도서 설명도서 설명"
        $0.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        $0.numberOfLines = 0
    }
    
    var likeButton = UIButton().then {
        $0.setImage(UIImage(systemName: "heart"), for: .normal)
        $0.tintColor = .systemPink
    }
    
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        addItmeToSubviews()
        setConstraints()
        likeButton.addTarget(self, action: #selector(likeButtonClicked(_:)), for: .touchUpInside)
    }
    
    @objc func likeButtonClicked(_ sender: UIButton) {
        if isClicked {
            isClicked = false
        } else {
            isClicked = true
        }
        likeButtonAction()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        fatalError()
    }
    
    func configureCell(row: Book) {
        titleLabel.text = row.title.replacingOccurrences(of: "<b>", with: "").replacingOccurrences(of: "</b>", with: "")
        subtitleLabel.text = row.itemDescription.replacingOccurrences(of: "<b>", with: "").replacingOccurrences(of: "</b>", with: "")
    }
    
    func configureMyBookCell(row: UserBook) {
        titleLabel.text = row.title
        subtitleLabel.text = row.subtitle
        likeButton.setImage(UIImage(systemName: "heart.fill"), for: .normal)
        isClicked = true
    }
    
    func addItmeToSubviews() {
        [image, titleLabel, subtitleLabel, likeButton].map {
            contentView.addSubview($0)
        }
    }
    
    func setConstraints() {
        image.snp.makeConstraints {
            $0.top.leading.equalToSuperview().offset(20)
            $0.width.equalToSuperview().multipliedBy(0.25)
            $0.height.equalTo(image.snp.width).multipliedBy(1.2)
        }
        
        titleLabel.snp.makeConstraints {
            $0.top.equalTo(image)
            $0.leading.equalTo(image.snp.trailing).offset(10)
            $0.trailing.equalToSuperview().inset(20)
        }
        
        subtitleLabel.snp.makeConstraints {
            $0.leading.equalTo(titleLabel)
            $0.top.equalTo(titleLabel.snp.bottom).offset(10)
            $0.trailing.equalTo(likeButton.snp.leading).inset(10)
            $0.height.greaterThanOrEqualTo(image.snp.height)
            $0.bottom.equalToSuperview().inset(20)
        }
        
        likeButton.snp.makeConstraints {
            $0.width.height.equalTo(50)
            $0.top.equalTo(subtitleLabel)
            $0.trailing.equalToSuperview().inset(20)
        }
    }
}
