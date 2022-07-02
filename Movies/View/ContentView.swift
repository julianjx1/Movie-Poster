//
//  ContentView.swift
//  Movies
//
//  Created by Mahir Shahriar Lipeng on 2/7/22.
//

import SwiftUI
struct ContentView: View {
    @ObservedObject var viewModel: PosterListViewModel

    var body: some View {
        NavigationView{
            VStack{
                SearchBar(term: $viewModel.search)
                if viewModel.posters.isEmpty{
                    EmptyStateView()
                }else{
                    
                    List {
                        
                        ForEach(viewModel.posters){ poster in
                            MovieView(poster: poster)
                        }
                        if viewModel.page < viewModel.lastPage {
                            Divider()
                            Text("Loading ...")
                                .padding(.vertical).onAppear {
                                    viewModel.page += 1
                                    
                                }
                            
                        }
                        
                    }
                    .listStyle(PlainListStyle())
                }
                
            }
            .navigationTitle("Movie List")
        }
    }
}



struct SearchBar: UIViewRepresentable {
    typealias UIViewType = UISearchBar
    
    @Binding var term: String
    
    
    func makeUIView(context: Context) -> UISearchBar {
        let searchBar = UISearchBar(frame: .zero)
        searchBar.delegate = context.coordinator
        searchBar.searchBarStyle = .minimal
        searchBar.placeholder = "Type a movie name"
        return searchBar
    }
    
    func updateUIView(_ uiView: UISearchBar, context: Context) {
        
    }
    
    func makeCoordinator() -> SearchBarCoordinator {
        return SearchBarCoordinator(term: $term)
    }
    
    class SearchBarCoordinator: NSObject, UISearchBarDelegate{
        
        
        @Binding var term: String
        
        init(term: Binding<String>) {
            self._term = term
        }
        
        func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
            
            term = searchBar.text ?? ""
            UIApplication.shared.windows.first {
                $0.isKeyWindow
            }?.endEditing(true)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewModel: PosterListViewModel())
    }
}
