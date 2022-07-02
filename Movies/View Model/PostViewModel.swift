//
//  PostViewModel.swift
//  Movies
//
//  Created by Mahir Shahriar Lipeng on 3/7/22.
//

import Foundation
import SwiftUI
import Combine

class PosterViewModel: Identifiable, ObservableObject {
    
   // var posterImage: String?
    let movieName: String
    let movieDescription: String
    @Published var posterImage: Image?
    
    init(poster: Poster) {
        movieName = poster.title ?? ""
        movieDescription = poster.overview ?? ""
    }
    
    

   
}
