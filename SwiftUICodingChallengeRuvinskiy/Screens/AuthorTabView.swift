//
//  AuthorTabView.swift
//  SwiftUICodingChallengeRuvinskiy
//
//  Created by David Ruvinskiy on 1/20/21.
//

import SwiftUI

struct AuthorTabView: View {
    var body: some View {
        TabView {
            AuthorListView()
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }
            
            FavoriteQuoteView()
                .tabItem {
                    Image(systemName: "heart")
                    Text("Favorite Quotes")
                }
        }
    }
}

struct AuthorTabView_Previews: PreviewProvider {
    static var previews: some View {
        AuthorTabView()
    }
}
