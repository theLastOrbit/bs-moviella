//
//  MovieRemoteImage.swift
//  Moviella
//
//  Created by MD RUBEL on 30/5/22.
//

import SwiftUI

struct MovieRemoteImage: View {
    
    @StateObject private var viewModel = MovieRemoteImageViewModel()
    
    var urlString: String
    
    var body: some View {
        RemoteImage(image: viewModel.image)
            .onAppear { viewModel.load(fromURL: urlString) }
    }
}

struct RemoteImage: View {
    
    var image: Image?
    
    var body: some View {
        image?.resizable() ?? Image("placeholder").resizable()
    }
}
