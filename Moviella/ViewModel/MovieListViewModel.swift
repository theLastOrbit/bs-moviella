//
//  MovieListViewModel.swift
//  Moviella
//
//  Created by MD RUBEL on 30/5/22.
//

import Foundation

final class MovieListViewModel: ObservableObject {
    
    @Published var movies: [Movie] = []
    @Published var isLoading = false
    
    func getMovies() {
        isLoading = true
        
        NetworkManager.shared.getMovies { [weak self] result in
            
            DispatchQueue.main.async {
                
                self?.isLoading = false
                
                switch result {
                case .success(let movies):
                    self?.movies = movies
                    
                case .failure(let error):
                    print("==> Error \(error)")
                }
            }
        }
    }
}
