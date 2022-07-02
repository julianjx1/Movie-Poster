//
//  MovieView.swift
//  Movies
//
//  Created by Mahir Shahriar Lipeng on 3/7/22.
//

import SwiftUI

struct MovieView: View{
    @ObservedObject var poster: PosterViewModel
    
    var body: some View{
        HStack{
            PosterView(image: poster.posterImage)
                .padding(.trailing)
            VStack(alignment: .leading){
                Text(poster.movieName)
                Text(poster.movieDescription)
                    .font(.footnote)
                    .foregroundColor(.gray)
            }
        }
        .padding()
    }
}
struct MovieView_Previews: PreviewProvider {
    static var previews: some View {
        MovieView(poster: PosterViewModel(poster: Poster(overview: "sdfasf asfsd", title: "title")))
    }
}
