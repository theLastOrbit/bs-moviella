//
//  MovieModel.swift
//  Moviella
//
//  Created by MD RUBEL on 30/5/22.
//

import Foundation

struct MovieModel: Decodable {
    
    let results: [Movie]
    
    enum CodingKeys: String, CodingKey {
        case results = "results"
    }
}

struct Movie: Decodable {
    
    let id: Int
    let overview: String
    let posterPath: String
    let title: String
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case overview = "overview"
        case posterPath = "poster_path"
        case title = "title"
    }
}

struct MovieMockData {
    
    static let movie = Movie(
        id: 299537,
        overview: "The story follows Carol Danvers as she becomes one of the universe’s most powerful heroes when Earth is caught in the middle of a galactic war between two alien races. Set in the 1990s, Captain Marvel is an all-new adventure from a previously unseen period in the history of the Marvel Cinematic Universe.",
        posterPath: "/AtsgWhDnHTq68L0lLsUrCnM7TjG.jpg",
        title: "Captain Marvel"
    )
}
