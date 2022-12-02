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
    func reloadCollectionView()
    func navigateToDetailScreen(movie: MovieResult)
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
    func navigateToDetailScreen(movie: MovieResult) {
        DispatchQueue.main.async {
            self.navigationController?.pushViewController(DetailScreen(movie: movie), animated: true)
        }
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        viewModel.getDetail(id: viewModel.movies[indexPath.item]._id)
    }
    func reloadCollectionView() {
        collectionView.reloadOnMainThread()
    }
    
    func configureVC() {
        view.backgroundColor = .systemBackground
        title = "Populer Movies "
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
        viewModel.movies.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier:MovieCell.reuseID, for: indexPath) as! MovieCell
        cell.setCell(movie: viewModel.movies[indexPath.item])
        return cell
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        
        let offsetY = scrollView.contentOffset.y
        let contentHeight = scrollView.contentSize.height
        let heigh = scrollView.frame.size.height
        if offsetY >= contentHeight - (2 * heigh) {
            viewModel.getMovies()
        }
    }
}

