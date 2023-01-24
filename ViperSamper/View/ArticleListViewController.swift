//
//  ArticleListViewController.swift
//  ViperSamper
//
//  Created by Wataru Fujiwara on 2023/01/18.
//

import UIKit

class ArticleListViewController: UIViewController {
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
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = "記事のタイトル"
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
