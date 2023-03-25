//
//  ArticleListAPIClient.swift
//  SampleQiitaList
//
//  Created by 渡邊魁優 on 2023/03/25.
//

import Foundation

class ArticleListAPIClient {
    //成功した時は[Article]、失敗した時はAPIErrorが帰ってくる。
    func fetch(completion: @escaping (Result<[Article], APIError>) -> Void) {
        //URL作成
        guard let url = URL(string: "https://qiita.com/api/v2/items") else {
            //URLが無効な場合
            return completion(.failure(.invalidURL))
        }
        
        //リクエスト
        let reqest = URLRequest(url: url)
        URLSession.shared.dataTask(with: reqest) { (data, response, error) in
            //responseはステータスコード
            do {
                guard let data = data else {
                    //データが取得できない場合
                    throw APIError.networkError
                }
                guard let articleList = try? JSONDecoder().decode([Article].self, from: data) else {
                    //取得したデータをデコードできない場合
                    throw APIError.DecodeError
                }
                DispatchQueue.main.async {
                    //成功
                    completion(.success(articleList))
                }
            } catch {
                //失敗の種類によって返す値を変える
                switch error as? APIError {
                case .networkError:
                    completion(.failure(.networkError))
                case .invalidURL:
                    completion(.failure(.invalidURL))
                case .DecodeError:
                    completion(.failure(.DecodeError))
                default:
                    completion(.failure(.unknown))
                }
            }
        }
        //実行
        .resume()
    }
}
