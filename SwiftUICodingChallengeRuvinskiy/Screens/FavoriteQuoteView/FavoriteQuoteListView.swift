//
//  FavoriteQuoteListView.swift
//  SwiftUICodingChallengeRuvinskiy
//
//  Created by David Ruvinskiy on 1/20/21.
//

import SwiftUI

struct FavoriteQuoteListView: View {
    @EnvironmentObject var favoriteQuotes: FavoriteQuotes
    
    var body: some View {
        NavigationView {
            ZStack {
                List(favoriteQuotes.quotes) { quote in
                    FavoriteListCell(quote: quote)
                }
                .listStyle(PlainListStyle())
                .navigationTitle("❤️ Favorites")
                
                if favoriteQuotes.quotes.isEmpty {
                    EmptyState(imageName: "empty-box", message: "No favorite quotes?\nAdd one on the author screen.")
                }
            }
        }
    }
}

struct FavoriteQuoteView_Previews: PreviewProvider {
    static var previews: some View {
        FavoriteQuoteListView()
            .environmentObject(FavoriteQuotes())
    }
}
