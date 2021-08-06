//
//  CollectionViewCell.swift
//  ExaminationTask
//
//  Created by Кирилл Блохин on 05.08.2021.
//

import UIKit
import SnapKit

final class PhotoCollectionViewCell: UICollectionViewCell {
    
    let photoCellImage: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFill
        return image
    }()
    
    override func awakeFromNib() {
        super.awakeFromNib()
        addSubview(photoCellImage)
        constraints()
    }
    
    func constraints() {
        photoCellImage.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }
}
