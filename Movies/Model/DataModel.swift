//
//  DataModel.swift
//  Movies
//
//  Created by Mahir Shahriar Lipeng on 3/7/22.
//

import Foundation

class DataModel{
    
    private var dataTask: URLSessionDataTask?
    
    func loadPosters(search: String, page:Int, completion: @escaping([Poster], Int, Int)->Void){
        dataTask?.cancel()
        guard let url = buildUrl(forTerm: search, forPage: page) else { return completion([], 1, 1) }
        
        dataTask = URLSession.shared.dataTask(with: url, completionHandler: { data, _, _ in
            guard let data = data else  { return completion([],1,1) }
            
            print(String(decoding: data, as: UTF8.self))
            if let response = try? JSONDecoder().decode(Response.self, from: data){
                completion(response.results!, response.page ?? 1, response.totalPages ?? 1)
            }
                
        })
        dataTask?.resume()
    }
    
    private func buildUrl(forTerm search: String,forPage page:Int) -> URL? {
        guard !search.isEmpty else {return nil}
        
        let queryItems = [
            URLQueryItem(name: "api_key", value: "38e61227f85671163c275f9bd95a8803"),
         URLQueryItem(name: "query", value: search),
            URLQueryItem(name: "page", value: String(page))
        ]
        var components = URLComponents(string: "https://api.themoviedb.org/3/search/movie")
        components?.queryItems = queryItems
        
        return components?.url
    }
}
