//
//  QuoteListCell.swift
//  SwiftUICodingChallengeRuvinskiy
//
//  Created by David Ruvinskiy on 1/20/21.
//

import SwiftUI

struct QuoteListCell: View {
    var quote: Quote
    @EnvironmentObject var favoriteQuotes: FavoriteQuotes
    
    var body: some View {
        HStack {
            Text(quote.quoteText)
                .font(.body)
            
            Spacer()
            
            Button {
                favoriteQuotes.favoriteUnfavorite(quote)
            } label: {
                
                Image(systemName: favoriteQuotes.isFavorite(quote) ? "heart.fill" : "heart")
                    .foregroundColor(Color(.label))
                    .imageScale(.large)
                    .frame(width: 44, height: 44)
            }
            .buttonStyle(BorderlessButtonStyle())
            
        }
        .padding()
    }
}

struct QuoteListCell_Previews: PreviewProvider {
    static var previews: some View {
        QuoteListCell(quote: Quote.mockQuote)
            .environmentObject(FavoriteQuotes())
    }
}
