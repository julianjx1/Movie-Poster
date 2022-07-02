//
//  EmptyStateView.swift
//  Movies
//
//  Created by Mahir Shahriar Lipeng on 3/7/22.
//

import SwiftUI

struct EmptyStateView: View {
    var body: some View{
        VStack{
            Spacer()
            Image("movie-poster")
                .resizable()
                .frame(width: 100, height: 100, alignment: .center)
                .padding(.bottom)
            Text("Start searching for movie")
                .font(.title)
            Spacer()
        }
        .padding()
        .foregroundColor(Color(.systemIndigo))
    }
    
}

struct EmptyStateView_Previews: PreviewProvider {
    static var previews: some View {
        EmptyStateView()
    }
}
