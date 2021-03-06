//
//  PhotoCollectionViewCell.swift
//  Photo
//
//  Created by 성민주민주 on 2022/06/05.
//

import UIKit
import SnapKit

class PhotoCollectionViewCell: UICollectionViewCell {
    static let identifier = "PhotoCollectionViewCell"
    
    var photoView: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(systemName: "photo")
        imageView.tintColor = .white
        imageView.contentMode = .scaleToFill
        return imageView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        constraints()
        contentView.backgroundColor = .systemGray
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has been implemented")
    }
    
    func constraints() {
        contentView.addSubview(photoView)
        
        photoView.snp.makeConstraints {
            $0.edges.equalToSuperview()
        }
    }
}
