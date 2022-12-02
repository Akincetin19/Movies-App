//
//  DetailScreen.swift
//  Movies-App
//
//  Created by Akın Çetin on 2.12.2022.
//

import UIKit

class DetailScreen: UIViewController {

    let movie: MovieResult
    
    init(movie: MovieResult) {
        self.movie = movie
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
        print(movie.title ?? "")
    }
}
