//
//  QuoteResponse.swift
//  SwiftUICodingChallengeRuvinskiy
//
//  Created by David Ruvinskiy on 1/19/21.
//

import Foundation

struct QuoteResponse: Decodable {
    let data: [Quote]
}

struct Quote: Decodable, Identifiable, Equatable {
    var id: String = UUID().uuidString
    let quoteText: String
    let quoteAuthor: String
    
    private enum CodingKeys: String, CodingKey {
        case quoteText, quoteAuthor, id = "_id"
    }
    
    static let mockQuote = Quote(quoteText: "The age of a woman doesn't mean a thing. The best tunes are played on the oldest fiddles.", quoteAuthor: "Ralph Waldo Emerson")
}
