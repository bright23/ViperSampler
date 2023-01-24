//
//  GetArticleByIdUseCase.swift
//  ViperSamper
//
//  Created by Wataru Fujiwara on 2023/01/24.
//

import Foundation

class GetArticleByIdUseCase: UseCaseProtocol {
    
    func execute(_ parameter: Int, completion: ((Result<ArticleEntity, Error>) -> ())?) {
        let res = ArticleEntity(id: 1, userId: 1, title: "タイトル", body: "本文")
        
        completion?(.success(res))
    }
}
