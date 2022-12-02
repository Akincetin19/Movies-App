//
//  MovieService.swift
//  Movies-App
//
//  Created by Akın Çetin on 30.11.2022.
//

import Foundation

class MovieService {
    
    
    func downloadMovies(page: Int ,completion: @escaping ([MovieResult]?) -> ()) {
        guard let url = URL(string: APIURLs.movies(page: page)) else {return}
        
        NetworkManager.shared.download(url: url) { [weak self] result in
            
            guard let self = self else{return}
            switch result {
                
            case .success(let data):
                completion(self.handleWithData(data: data))
            case .failure(let error):
                self.handleWithError(error: error)
            }
        }
    }
    func downloadDetail(id: Int, completion: @escaping (MovieResult?) -> ()){
        guard let url = URL(string: APIURLs.detail(id: id)) else {return}
        NetworkManager.shared.download(url: url) { [weak self] result in
            guard let self = self else {return}
            
            switch result {
            case .success(let data):
                completion(self.handleWithData(data: data))
            case .failure(let error):
                self.handleWithError(error: error)
            }
        }
    }
    private func handleWithError(error: Error) {
        print(error.localizedDescription)
    }
    private func handleWithData(data: Data) -> [MovieResult]? {
        do {
            let movie = try JSONDecoder().decode(Movie.self, from: data)
            return movie.results
        } catch  {
            return nil
        }
    }
    private func handleWithData(data: Data) -> MovieResult? {
        do {
            let movieDetail = try JSONDecoder().decode(MovieResult.self, from: data)
            return movieDetail
        } catch {
            print(error)
            return nil
        }
    }
}
