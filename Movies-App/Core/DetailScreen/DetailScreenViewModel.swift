//
//  DetailScreenViewModel.swift
//  Movies-App
//
//  Created by Akın Çetin on 2.12.2022.
//

import Foundation

protocol DetailViewModelInterface {
    var view: DetailScreenInterface? {get set}
    func viewDidLoad()
}

final class DetailViewModel {
    weak var view: DetailScreenInterface?
}
extension DetailViewModel: DetailViewModelInterface {
    func viewDidLoad() {
        view?.configureVC()
        view?.configurePosterImageView()
        view?.downloadPosterImage()
        view?.configureTitleLabel()
        view?.configureDatelabel()
        view?.configureOverviewLabel()
    }
    
    
}

