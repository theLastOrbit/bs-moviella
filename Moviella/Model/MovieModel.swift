//
//  MovieModel.swift
//  Moviella
//
//  Created by MD RUBEL on 30/5/22.
//

import Foundation

struct MovieModel: Decodable {
    
    let page: Int
    let results: [Movie]
    let totalPages: Int
    let totalResults: Int
    
    enum CodingKeys: String, CodingKey {
        case page = "page"
        case results = "results"
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
}

struct Movie: Decodable {
    
    let adult: Bool
    let backdropPath: String?
    let genreIds: [Int]
    let id: Int
    let originalLanguage: OriginalLanguage
    let originalTitle: String
    let overview: String
    let popularity: Float
    let posterPath: String
    let releaseDate: String
    let title: String
    let video: Bool
    let voteAverage: Float
    let voteCount: Int
    
    enum CodingKeys: String, CodingKey {
        case adult = "adult"
        case backdropPath = "backdrop_path"
        case genreIds = "genre_ids"
        case id = "id"
        case originalLanguage = "original_language"
        case originalTitle = "original_title"
        case overview = "overview"
        case popularity = "popularity"
        case posterPath = "poster_path"
        case releaseDate = "release_date"
        case title = "title"
        case video = "video"
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
    }
}

enum OriginalLanguage: String, Decodable {
    
    case en = "en"
    case fr = "fr"
    case unknown
    
    public init(from decoder: Decoder) throws {
        self = try OriginalLanguage(rawValue: decoder.singleValueContainer().decode(RawValue.self)) ?? .unknown
    }
}

struct MovieMockData {
    
    static let movie = Movie(
        adult: false,
        backdropPath: "/w2PMyoyLU22YvrGK3smVM9fW1jj.jpg",
        genreIds: [28, 12, 878],
        id: 299537,
        originalLanguage: .en,
        originalTitle: "Captain Marvel",
        overview: "The story follows Carol Danvers as she becomes one of the universe’s most powerful heroes when Earth is caught in the middle of a galactic war between two alien races. Set in the 1990s, Captain Marvel is an all-new adventure from a previously unseen period in the history of the Marvel Cinematic Universe.",
        popularity: 117.264,
        posterPath: "/AtsgWhDnHTq68L0lLsUrCnM7TjG.jpg",
        releaseDate: "2019-03-06",
        title: "Captain Marvel",
        video: false,
        voteAverage: 6.9,
        voteCount: 13089
    )
}
