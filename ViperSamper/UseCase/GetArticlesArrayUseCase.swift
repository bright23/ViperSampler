//
//  GetArticlesArrayUseCase.swift
//  ViperSamper
//
//  Created by Wataru Fujiwara on 2023/01/24.
//

import Foundation

class GetArticlesArrayUseCase: UseCaseProtocol {
    
    func execute(_ parameter: Void, completion: ((Result<[ArticleEntity], Error>) -> ())?) {
        let res: [ArticleEntity] = [
            ArticleEntity(id: 1, userId: 1, title: "タイトル", body: "本文"),
            ArticleEntity(id: 2, userId: 1, title: "タイトル2", body: "本文2"),
            ArticleEntity(id: 3, userId: 1, title: "タイトル3", body: "本文3"),
        ]
        
        completion?(.success(res))
    }
}
