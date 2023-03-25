//
//  APIError.swift
//  SampleQiitaList
//
//  Created by 渡邊魁優 on 2023/03/25.
//

import Foundation

enum APIError: Error {
    case invalidURL
    case networkError
    case DecodeError
    case unknown

    var title: String {
        switch self {
        case .DecodeError:
            return "解析エラー"
        case .invalidURL:
            return "無効なURLのエラー"
        case .networkError:
            return "ネットワークエラー"
        default:
            return "不明なエラー"
        }
    }
}
