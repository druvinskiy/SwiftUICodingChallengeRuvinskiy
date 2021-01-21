//
//  AuthorListView.swift
//  SwiftUICodingChallengeRuvinskiy
//
//  Created by David Ruvinskiy on 1/19/21.
//

import SwiftUI

struct AuthorListView: View {
    @StateObject var viewModel = AuthorListViewModel()
    
    
    var body: some View {
        ZStack {
            NavigationView {
                VStack {
                    SearchBar(text: $viewModel.searchText)
                    
                    List(viewModel.filteredAuthors.indices, id: \.self) { index in
                        NavigationLink(destination: AuthorQuoteListView(author: viewModel.filteredAuthors[index])) {
                            Text(viewModel.filteredAuthors[index])
                                .font(.title2)
                                .fontWeight(.medium)
                            
                        }
                    }
                    .listStyle(PlainListStyle())
                    .navigationTitle("✍️ Authors")
                }
            }
            
            if viewModel.isLoading {
                LoadingView()
            }
            
            if viewModel.somethingWentWrong {
                ErrorScreens.somethingWentWrong
            }
        }
        .onAppear() {
            viewModel.getAuthors()
        }
    }
}

struct AuthorListView_Previews: PreviewProvider {
    static var previews: some View {
        AuthorListView()
    }
}
