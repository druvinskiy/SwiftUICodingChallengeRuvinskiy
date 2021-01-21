//
//  AuthorQuoteListView.swift
//  SwiftUICodingChallengeRuvinskiy
//
//  Created by David Ruvinskiy on 1/19/21.
//

import SwiftUI

struct AuthorQuoteListView: View {
    var author: String
    @StateObject var viewModel = AuthorQuoteListViewModel()
    
    var body: some View {
        ZStack {
            List(viewModel.quotes) { quote in
                QuoteListCell(quote: quote)
            }
            .navigationTitle(author)
            
            if viewModel.isLoading {
                LoadingView()
            }
            
            if viewModel.somethingWentWrong {
                ErrorScreens.somethingWentWrong
            }
        }
        .onAppear() {
            viewModel.getQuotes(for: author)
        }
    }
}

struct AuthorQuoteListView_Previews: PreviewProvider {
    static var previews: some View {
        AuthorQuoteListView(author: "Ralph Waldo Emerson")
    }
}
