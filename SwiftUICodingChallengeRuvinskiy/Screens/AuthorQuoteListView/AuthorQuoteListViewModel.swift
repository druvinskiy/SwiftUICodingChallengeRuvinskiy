//
//  AuthorQuoteListViewModel.swift
//  SwiftUICodingChallengeRuvinskiy
//
//  Created by David Ruvinskiy on 1/19/21.
//

import Foundation

final class AuthorQuoteListViewModel: ObservableObject {
    @Published var quotes: [Quote] = []
    @Published var isLoading = false
    @Published var somethingWentWrong = false
    
    func getQuotes(for author: String) {
        isLoading = true
        
        NetworkManager.shared.getQuotes(for: author) { [self] result in
            DispatchQueue.main.async {
                isLoading = false
                
                switch result {
                case .success(let quotes):
                    self.quotes = quotes
                    
                case .failure(_):
                    somethingWentWrong = true
                }
            }
        }
    }
}
