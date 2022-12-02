//
//  APIURLs.swift
//  Movies-App
//
//  Created by Akın Çetin on 30.11.2022.
//

import Foundation

enum APIURLs {
    static func movies(page: Int) -> String {
        "https://api.themoviedb.org/3/movie/popular?api_key=55c4eb4142ce25f28f8f00803432e813&language=en-US&page=\(page)"
    }
    
    static func imageURL(posterPath: String) -> String {
        "https://image.tmdb.org/t/p/w500\(posterPath)"
    }
    
    static func detail(id: Int) -> String {
        "https://api.themoviedb.org/3/movie/\(id)?api_key=55c4eb4142ce25f28f8f00803432e813&language=en-US"
    }
}
