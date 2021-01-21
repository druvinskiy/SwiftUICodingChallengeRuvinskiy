//
//  NetworkManager.swift
//  SwiftUICodingChallengeRuvinskiy
//
//  Created by David Ruvinskiy on 1/19/21.
//

import Foundation

final class NetworkManager {
    static let shared = NetworkManager()
    
    static let baseURL = "https://quote-garden.herokuapp.com/api/v3/"
    private let authorURL = baseURL + "authors"
    private let quoteURL = baseURL + "quotes"
    
    private init() {}
    
    func getAuthors(completed: @escaping (Result<[String], DRError>) -> Void) {
        fetchGenericJSONData(urlString: authorURL) { (result: Result<AuthorResponse, DRError>) in
            switch result {
            case .success(let response):
                completed(.success(response.data))
                
            case .failure(let error):
                completed(.failure(error))
            }
        }
    }
    
    func getQuotes(for author: String, completed: @escaping (Result<[Quote], DRError>) -> Void) {
        let urlString = quoteURL + "?author=\(author.replacingOccurrences(of: " ", with: "%20"))"
        
        fetchGenericJSONData(urlString: urlString) { (result: Result<QuoteResponse, DRError>) in
            switch result {
            case .success(let response):
                completed(.success(response.data))
                
            case .failure(let error):
                completed(.failure(error))
            }
        }
    }
    
    private func fetchGenericJSONData<T: Decodable>(urlString: String, completed: @escaping (Result<T, DRError>) -> Void) {
        guard let url = URL(string: urlString) else {
            completed(.failure(.invalidURL))
            return
        }
        
        let task = URLSession.shared.dataTask(with: URLRequest(url: url)) { data, response, error in
            if let _ = error {
                completed(.failure(.unableToComplete))
                return
            }
            
            guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
                completed(.failure(.invalidResponse))
                return
            }
            
            guard let data = data else {
                completed(.failure(.invalidResponse))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let decodedResponse = try decoder.decode(T.self, from: data)
                completed(.success(decodedResponse))
            } catch {
                completed(.failure(.invalidData))
            }
        }
        
        task.resume()
    }
}
