//
//  ViewController.swift
//  Movies-App
//
//  Created by Akın Çetin on 30.11.2022.
//

import UIKit

protocol HomeViewControllerInterface: AnyObject {
    func configureVC()
    func configureCollectionView()
}

final class HomeScreen: UIViewController {

    private let viewModel = HomeViewModel()
    private var collectionView: UICollectionView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .red
        viewModel.view = self
        viewModel.viewDidLoad()
    }
}
extension HomeScreen: HomeViewControllerInterface {
    func configureVC() {
        view.backgroundColor = .systemBackground
    }
    func configureCollectionView() {
        
        collectionView = UICollectionView(frame: .zero, collectionViewLayout: UIHelper.createHomeFlowLayout())
        view.addSubview(collectionView)
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.pinToEdgesOf(view: view)
        collectionView.backgroundColor = .black
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(MovieCell.self, forCellWithReuseIdentifier: MovieCell.reuseID)
    }
}
extension HomeScreen: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier:MovieCell.reuseID, for: indexPath) as! MovieCell
        
        
        return cell
    }
    
    
}

