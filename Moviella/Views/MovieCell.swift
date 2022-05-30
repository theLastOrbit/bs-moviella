//
//  MovieCell.swift
//  Moviella
//
//  Created by MD RUBEL on 30/5/22.
//

import SwiftUI

struct MovieCell: View {
    
    let movie: Movie
    
    var body: some View {
        HStack {
            MovieRemoteImage(urlString: movie.posterPath)
                .aspectRatio(contentMode: .fit)
                .frame(width: 100, height: 150)
                .cornerRadius(8)
            
            VStack(alignment: .leading, spacing: 5) {
                Text(movie.title)
                    .font(.title2)
                    .fontWeight(.medium)
                    .lineLimit(2)
                    .minimumScaleFactor(0.5)
                
                Text(movie.overview)
                    .foregroundColor(.secondary)
                    .fontWeight(.regular)
                    .lineLimit(6)
            }
            .padding(.leading, 4)
        }
        .padding(.vertical, 4)
    }
}

struct MovieCell_Previews: PreviewProvider {
    static var previews: some View {
        MovieCell(movie: MovieMockData.movie)
    }
}
