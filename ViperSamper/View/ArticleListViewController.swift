//
//  ArticleListViewController.swift
//  ViperSamper
//
//  Created by Wataru Fujiwara on 2023/01/18.
//

import UIKit

class ArticleListViewController: UIViewController {
    
    static func instantiate() -> ArticleListViewController {
        
        guard let articleListViewController = UIStoryboard(name: "ArticleList", bundle: nil).instantiateInitialViewController() as? ArticleListViewController else {
            fatalError()
        }
        // presenterを外から入れてあげる
        // View自体の参照を渡し
        articleListViewController.presenter = ArticleListPresenter(view: articleListViewController)
        return articleListViewController
    }
    
    var presenter: ArticleListPresenterProtocol!
    
    @IBOutlet weak var tableView: UITableView!
    
    private var articleEntities = [ArticleEntity]()
  
    override func viewDidLoad() {
        super.viewDidLoad()
        self.presenter.didLoad()
    }
}

extension ArticleListViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.articleEntities.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = self.articleEntities[indexPath.row].title
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}

extension ArticleListViewController: ArticleListViewProtocol {
    func showArticles(_ articleEntities: [ArticleEntity]) {
        self.articleEntities = articleEntities
        self.tableView.reloadData()
    }
    
    func showEmpty() {
        self.tableView.isHidden = true
        self.showArticles([])
    }
    
    func showError(_ error: Error) {
        // skip
    }
}
