//
//  MoviesApp.swift
//  Movies
//
//  Created by Mahir Shahriar Lipeng on 2/7/22.
//

import SwiftUI

@main
struct MoviesApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(viewModel: PosterListViewModel())
        }
    }
}
