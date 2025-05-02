//
//  HomeViewModel.swift
//  MOvie
//
//  Created by Zohra Guliyeva  on 30.03.25.
//

import Foundation

final class HomeViewModel { //final - bu class-ın başqa class tərəfindən inherit olunmasın
    private(set) var movies: [MovieResult] = []
    
    var onMoviesFetched: (() -> Void)?
    
    func fetchPopularMovies() {
        NetworkManager.shared.fetch(endpoint: .popular) { [weak self] (result: Result<Movie, Error>) in
            switch result {
            case .success(let movieResponse):
                self?.movies = movieResponse.results ?? []
                self?.onMoviesFetched?() // Controller-ə deyirik: məlumat gəldi
            case .failure(let error):
                print("Error loading movies:", error)
            }
        }
    }
}
