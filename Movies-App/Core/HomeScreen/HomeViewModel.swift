//
//  HomeViewModel.swift
//  Movies-App
//
//  Created by Akın Çetin on 30.11.2022.
//

import Foundation

protocol HomeViewModelInterface {
    var view: HomeViewControllerInterface? { get set }
    func viewDidLoad()
}

final class HomeViewModel {
    weak var view: HomeViewControllerInterface?
}
extension HomeViewModel: HomeViewModelInterface {
    func viewDidLoad() {
        view?.configureVC()
        view?.configureCollectionView()
    }
    
    
}
