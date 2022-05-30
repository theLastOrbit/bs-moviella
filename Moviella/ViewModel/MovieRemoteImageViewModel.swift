//
//  MovieRemoteImageViewModel.swift
//  Moviella
//
//  Created by MD RUBEL on 30/5/22.
//

import SwiftUI

final class MovieRemoteImageViewModel: ObservableObject {
    
    @Published var image: Image? = nil
    
    func load(fromURL url: String) {
        
        NetworkManager.shared.downloadImage(from: url) { [weak self] uiImage in
            
            guard let uiImage = uiImage else { return }
            
            DispatchQueue.main.async {
                self?.image = Image(uiImage: uiImage)
            }
        }
    }
}
