//
//  ArticleListRouterProtocol.swift
//  ViperSamper
//
//  Created by Wataru Fujiwara on 2023/01/24.
//

import UIKit

protocol ArticleListRouterProtocol: AnyObject {
    func showArticleDetail(articleEntity: ArticleEntity)
}

class ArticleListRouter: ArticleListRouterProtocol {
    
    weak var view: UIViewController!
    
    init(view: UIViewController) {
        self.view = view
    }
    
    func showArticleDetail(articleEntity: ArticleEntity) {
        let articleDetailViewController = ArticleDetailViewController.instantiate()
        articleDetailViewController.articleEntity = articleEntity
        
        articleDetailViewController.presenter = ArticleDetailPresenter(
            view: articleDetailViewController,
            inject: ArticleDetailPresenter.Dependency(
                getArticleByIdUseCase: UseCase(GetArticleByIdUseCase())
            )
        )
        view.navigationController?.pushViewController(articleDetailViewController,
                                                      animated: true)
    }
}
