//
//  Movie.swift
//  Movies-App
//
//  Created by Akın Çetin on 30.11.2022.
//

import Foundation

struct Movie: Decodable{
    
    let result: [MovieResult]?
}
struct MovieResult: Decodable{
    let id: Int?
    let posterPath: String?
    
    enum CodingKeys: String, CodingKey {
        case id
        case posterPath = "poster_path"
    }
}

