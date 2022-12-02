//
//  MovieCell.swift
//  Movies-App
//
//  Created by Akın Çetin on 1.12.2022.
//

import UIKit

final class MovieCell: UICollectionViewCell {
    
    static let reuseID = "MovieCell"
    
    private var posterImageView: PosterImageView!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        configureCell()
        configurePosterImageView()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    func setCell(movie: MovieResult) {
        posterImageView.downloadImage(movie: movie)
    }
    private func configureCell() {
        
        layer.cornerRadius = 15
        clipsToBounds = true //cellden taşan yerleri keser
    }
    private func configurePosterImageView() {
        posterImageView = PosterImageView(frame: .zero)
        addSubview(posterImageView)
        posterImageView.pinToEdgesOf(view: self)
        
    }
    override func prepareForReuse() {
        super.prepareForReuse()
        posterImageView.image = nil
        posterImageView.cancelDownloading() 
    }
}
