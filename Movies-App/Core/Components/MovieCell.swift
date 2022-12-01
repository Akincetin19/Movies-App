//
//  MovieCell.swift
//  Movies-App
//
//  Created by Akın Çetin on 1.12.2022.
//

import UIKit

class MovieCell: UICollectionViewCell {
    
    static let reuseID = "MovieCell"
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .orange
        
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    private func configureCell() {
        
    }
}
