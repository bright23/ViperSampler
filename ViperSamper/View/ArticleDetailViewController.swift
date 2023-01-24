//
//  ArticleDetailViewController.swift
//  ViperSamper
//
//  Created by Wataru Fujiwara on 2023/01/18.
//

import UIKit

class ArticleDetailViewController: UIViewController {
    
    static func instantiate() -> ArticleDetailViewController {
        guard let articleDetailViewController = UIStoryboard(name: "ArticleDetail", bundle: nil).instantiateInitialViewController() as? ArticleDetailViewController else {
            fatalError()
        }
        return articleDetailViewController
    }
    
    var articleEntity: ArticleEntity!
    var presenter: ArticleDetailPresenterProtocol!
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var detailTextView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.presenter.didLoad(articleEntity: self.articleEntity)
    }
}

extension ArticleDetailViewController: ArticleDetailViewProtocol {
    
    func showArticle(_ articleEntity: ArticleEntity) {
        self.articleEntity = articleEntity
        self.titleLabel.text = articleEntity.title
        self.detailTextView.text = articleEntity.body
    }
    
    func showError(_ error: Error) {
        // 今回はスキップ
    }
}
