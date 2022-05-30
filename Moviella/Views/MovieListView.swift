//
//  MovieListView.swift
//  Moviella
//
//  Created by MD RUBEL on 30/5/22.
//

import SwiftUI

struct MovieListView: View {
    
    @State private var movies: [Movie] = []
    @State private var isLoading = false
    
    var body: some View {
        ZStack {
            NavigationView {
                List(movies, id: \.id) { movie in
                    MovieCell(movie: movie)
                }
                .navigationTitle("Movie List")
            }
            .onAppear { getMovies() }
            
            if isLoading { LoadingView() }
        }
    }
    
    func getMovies() {
        isLoading = false
        
        NetworkManager.shared.getMovies { [self] result in
            
            DispatchQueue.main.async {
                isLoading = false
                
                switch result {
                case .success(let movies):
                    self.movies = movies
                    
                case .failure(let error):
                    print("==> Error \(error)")
                }
            }
        }
    }
}

struct MovieListView_Previews: PreviewProvider {
    static var previews: some View {
        MovieListView()
    }
}
