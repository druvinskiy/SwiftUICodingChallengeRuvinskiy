//
//  FavoriteQuotes.swift
//  SwiftUICodingChallengeRuvinskiy
//
//  Created by David Ruvinskiy on 1/20/21.
//

import SwiftUI

final class FavoriteQuotes: ObservableObject {
    @Published var quotes = [Quote]()
    
    func favoriteUnfavorite(_ quote: Quote) {
        if let index = quotes.firstIndex(of: quote) {
            quotes.remove(at: index)
        } else {
            quotes.append(quote)
        }
    }
    
    func isFavorite(_ quote: Quote) -> Bool {
        return quotes.contains(quote)
    }
}
