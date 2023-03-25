//
//  ContentView.swift
//  SampleQiitaList
//
//  Created by 渡邊魁優 on 2023/03/25.
//

import SwiftUI

struct ContentView: View {
    @StateObject var articleViewModel = ArticleViewModel()
    var body: some View {
        List(articleViewModel.articles) { article in
            Text(article.title)
        }
        .onAppear(perform: articleViewModel.onAppear)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
