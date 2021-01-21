//
//  SwiftUICodingChallengeRuvinskiyApp.swift
//  SwiftUICodingChallengeRuvinskiy
//
//  Created by David Ruvinskiy on 1/19/21.
//

import SwiftUI

@main
struct SwiftUICodingChallengeRuvinskiyApp: App {
    var favoriteQuotes = FavoriteQuotes()
    
    var body: some Scene {
        WindowGroup {
            AuthorTabView()
                .environmentObject(favoriteQuotes)
        }
    }
}
