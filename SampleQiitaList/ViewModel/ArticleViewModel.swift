//
//  ArticleViewModel.swift
//  SampleQiitaList
//
//  Created by 渡邊魁優 on 2023/03/25.
//

import Foundation

class ArticleViewModel: ObservableObject {
    @Published var articles: [Article] = []
    private let articleAPIClient = ArticleListAPIClient()
    
    func onAppear() {
        loadArticles()
    }
    
    private func loadArticles() {
        //(Result<[Article], APIError>) -> Void型のメソッド
        articleAPIClient.fetch(completion: { result in
            switch result {
                //[Article]が帰ってきた時の処理
            case .success(let articleList):
                self.articles = articleList
                
                //errorが帰ってきた時の処理
            case .failure(let error):
                print(error.title)
            }
        })
    }
}
