//
//  ArticleModel.swift
//  SampleQiitaList
//
//  Created by 渡邊魁優 on 2023/03/25.
//

import Foundation

struct Article: Codable, Identifiable {
    let title: String
    
    var id: String { title }
}
