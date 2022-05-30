//
//  NetworkManager.swift
//  Moviella
//
//  Created by MD RUBEL on 30/5/22.
//

import UIKit

class NetworkManager: NSObject {
    
    private override init() {}
    
    static let shared = NetworkManager()
    private let cache = NSCache<NSString, UIImage>()
    
    private let themoviedbURL = "https://api.themoviedb.org/3/search/movie?api_key=38e61227f85671163c275f9bd95a8803&query=$search"
    
    private let posterImageBaseUrl = "https://image.tmdb.org/t/p/w500"
    
    func getMovies(for query: String, completed: @escaping (Result<[Movie], CustomError>) -> Void) {
        
        let urlString = themoviedbURL.replacingOccurrences(of: "$search", with: query)
        
        guard
            let url = URL(string: urlString)
        else {
            completed(.failure(.invalidURL))
            return
        }
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, response, error in
            
            if let _ =  error {
                completed(.failure(.unableToComplete))
                return
            }
            
            guard
                let response = response as? HTTPURLResponse,
                response.statusCode == 200
            else {
                completed(.failure(.invalidResponse))
                return
            }
            
            guard
                let data = data
            else {
                completed(.failure(.invalidData))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let decodedResponse = try decoder.decode(MovieModel.self, from: data)
                
                completed(.success(decodedResponse.results))
                
            } catch {
                completed(.failure(.invalidData))
            }
        }
        
        task.resume()
    }
    
    func downloadImage(from urlString: String, completed: @escaping (UIImage?) -> Void) {
        
        let cacheKey = NSString(string: urlString)
        
        if let image = cache.object(forKey: cacheKey) {
            completed(image)
            return
        }
        
        guard
            let url = URL(string: posterImageBaseUrl + urlString)
        else {
            completed(nil)
            return
        }
        
        let task = URLSession.shared.dataTask(with: url) { [weak self] data, response, error in
            
            guard
                let data = data,
                let image = UIImage(data: data)
            else {
                completed(nil)
                return
            }
            
            self?.cache.setObject(image, forKey: cacheKey)
            completed(image)
        }
        
        task.resume()
    }
}
