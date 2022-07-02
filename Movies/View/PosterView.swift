//
//  PosterView.swift
//  Movies
//
//  Created by Mahir Shahriar Lipeng on 3/7/22.
//

import SwiftUI

struct PosterView: View {
    let image: Image?
    
    var body: some View{
        if image != nil {
            image!.resizable()
            .frame(width: 50, height: 100)
        }else{
        Image("movie-poster")
            .resizable()
            .frame(width: 50, height: 100)
        }
    }
}

struct PosterView_Previews: PreviewProvider {
    static var previews: some View {
        PosterView(image: nil)
    }
}
