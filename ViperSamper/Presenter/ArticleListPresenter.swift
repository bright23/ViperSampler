//
//  ArticleListPresenter.swift
//  ViperSamper
//
//  Created by Wataru Fujiwara on 2023/01/24.
//

import Foundation

// View側から送られ、Presenter側で受けるイベント
protocol ArticleListPresenterProtocol: AnyObject {
    // ViewがLoadされたらAPI通信して値を取りたいので、ViewがLoadされたとき
    func didLoad()
    // 一覧から記事を選択したとき
    func didSelect(articleEntity: ArticleEntity)
}

// Presenter側からView側へ送るべきイベント
protocol ArticleListViewProtocol: AnyObject {
    // 取得してきた配列データを画面に表示してもらう
    func showArticles(_ articleEntities: [ArticleEntity])
    // データがありませんでした
    func showEmpty()
    // エラーが発生しました
    func showError(_ error: Error)
}

class ArticleListPresenter {
    
    weak var view: ArticleListViewProtocol!
    
    init(view: ArticleListViewProtocol) {
        self.view = view
    }
}

extension ArticleListPresenter: ArticleListPresenterProtocol {
    
    func didLoad() {
        GetArticlesArrayUseCase().execute(()) { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let articleEntities):
                if articleEntities.isEmpty {
                    self.view.showEmpty()
                    return
                }
                self.view.showArticles(articleEntities)
            case .failure(let error):
                self.view.showError(error)
            }
        }
    }
    
    func didSelect(articleEntity: ArticleEntity) {
        
    }
}
