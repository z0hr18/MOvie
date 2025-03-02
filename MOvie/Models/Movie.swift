//
//  Movie.swift
//  MOvie
//
//  Created by Zohra Guliyeva  on 18.02.25.
//

import Foundation

// API-dən gələn JSON strukturu ilə uyğun model
struct Movie: Decodable {
    let id: Int?
    let title: String?
    let posterPath: String?
    let releaseDate: String?
    let voteAverage: Double?

    // JSON-dakıları Swift propertilərinə uyğunlaşdırırıq
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case posterPath = "poster_path"
        case releaseDate = "release_date"
        case voteAverage = "vote_average"
    }
}
