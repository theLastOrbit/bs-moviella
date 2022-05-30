//
//  MovieListView.swift
//  Moviella
//
//  Created by MD RUBEL on 30/5/22.
//

import SwiftUI

struct MovieListView: View {
    
    @Environment(\.colorScheme) var colorScheme
    
    @StateObject private var viewModel = MovieListViewModel()
    
    @State private var searchText = ""
    @State private var isDarkMode = false
    
    var body: some View {
        ZStack {
            NavigationView {
                List(viewModel.movies, id: \.id) { movie in
                    MovieCell(movie: movie)
                }
                .navigationTitle("Movie List")
                .searchable(text: $searchText, prompt: "Search for movies")
                .onSubmit(of: .search) {
                    viewModel.getMovies(for: searchText)
                }
                .navigationBarItems(trailing: Button(action: {
                    isDarkMode.toggle()
                }) {
                    Image(systemName: isDarkMode ? "sun.max" : "moon")
                        .imageScale(.small)
                        .foregroundColor(isDarkMode ? .white : .black)
                })
            }
            .onAppear { viewModel.getMovies() }
            
            if viewModel.isLoading { LoadingView() }
        }
        .onAppear {
            isDarkMode = colorScheme == .dark
        }
        .preferredColorScheme(isDarkMode ? .dark : .light)
    }
}

struct MovieListView_Previews: PreviewProvider {
    static var previews: some View {
        MovieListView()
    }
}
