//
//  PosterImageLoader.swift
//  Movies
//
//  Created by Mahir Shahriar Lipeng on 3/7/22.
//

import Foundation
import SwiftUI
class PosterImageLoader{
    private var dataTasks: [URLSessionDataTask] = []
    
    func loadPoster(forPoster poster: Poster, completion: @escaping ((Image?) -> Void)) {
        guard let imageUrl = URL(string: "https://image.tmdb.org/t/p/w500\(poster.posterPath ?? "")") else{
            completion(nil)
            return
        }
        let dataTask = URLSession.shared.dataTask(with: imageUrl) { data, _, _ in
            guard let data = data, let posterImage = UIImage(data: data) else {
                completion(nil)
                return
            }
            let image = Image(uiImage: posterImage)
            completion(image)

        }
        dataTasks.append(dataTask)
        dataTask.resume()
        
    }
    
    func reset(){
        dataTasks.forEach{$0.cancel()}
    }
}
