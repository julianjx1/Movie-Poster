//
//  PosterViewModel.swift
//  Movies
//
//  Created by Mahir Shahriar Lipeng on 2/7/22.
//

import Foundation
import SwiftUI
import Combine

class PosterListViewModel: ObservableObject {
    @Published var search:String = ""
    @Published var page:Int = 1
    @Published var lastPage:Int = 1
    @Published public private(set) var posters: [PosterViewModel] = []
    
    private let dataModel: DataModel = DataModel()
    private let posterImageLoader: PosterImageLoader = PosterImageLoader()
    private var disposables = Set<AnyCancellable>()
    
    init() {
        $search
            .sink(receiveValue: loadPosters(search: ))
            .store(in: &disposables)
        $page
            .sink(receiveValue: loadMorePosters(page: ))
            .store(in: &disposables)
    }
    
    private func loadPosters(search: String){
        posters.removeAll()
        posterImageLoader.reset()
        dataModel.loadPosters(search: search, page: page) { posters,currentPage,lastPage  in
            DispatchQueue.main.async {
                self.lastPage = lastPage
            }
           
            posters.forEach{self.appendPoster(poster: $0)}
        }
    }
    
    private func loadMorePosters(page: Int){
        dataModel.loadPosters(search: search, page: page) { posters,currentPage,lastPage  in
            posters.forEach{self.appendPoster(poster: $0)}
        }
    }
    
    private func appendPoster(poster: Poster){
        let posterViewModel = PosterViewModel(poster: poster)
        DispatchQueue.main.async {
            self.posters.append(posterViewModel)
        }
        posterImageLoader.loadPoster(forPoster: poster) { image in
            DispatchQueue.main.async {
                posterViewModel.posterImage = image
            }
        }
    }
}

