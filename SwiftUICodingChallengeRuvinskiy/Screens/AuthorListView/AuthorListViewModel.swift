//
//  AuthorListViewModel.swift
//  SwiftUICodingChallengeRuvinskiy
//
//  Created by David Ruvinskiy on 1/19/21.
//

import SwiftUI

final class AuthorListViewModel: ObservableObject {
    @Published var authors: [String] = []
    @Published var isLoading = false
    @Published var searchText = ""
    @Published var somethingWentWrong = false
    var firstAppear = true
    
    var filteredAuthors: [String] {
        return authors.filter { searchText.isEmpty ? true : $0.contains(searchText) }
    }
    
    func getAuthors() {
        guard firstAppear else { return }
        
        firstAppear = false
        isLoading = true
        
        NetworkManager.shared.getAuthors { [self] result in
            DispatchQueue.main.async {
                isLoading = false
                
                switch result {
                case .success(let authors):
                    self.authors = authors.filter { !$0.isEmpty }
                    
                case .failure(_):
                    somethingWentWrong = true
                }
            }
        }
    }
}
