//
//  MovieRemoteImage.swift
//  Moviella
//
//  Created by MD RUBEL on 30/5/22.
//

import SwiftUI

struct MovieRemoteImage: View {
    
    @StateObject private var imageViewModel = MovieRemoteImageViewModel()
    
    var urlString: String
    
    var body: some View {
        RemoteImage(image: imageViewModel.image)
            .onAppear { imageViewModel.load(fromURL: urlString) }
    }
}

struct RemoteImage: View {
    
    var image: Image?
    
    var body: some View {
        image?.resizable() ?? Image("placeholder").resizable()
    }
}
