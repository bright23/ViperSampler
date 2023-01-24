//
//  ArticleListPresenter.swift
//  ViperSamper
//
//  Created by Wataru Fujiwara on 2023/01/24.
//

import Foundation

protocol ArticleListPresenterProtocol: AnyObject {

}

protocol ArticleListViewProtocol: AnyObject {

}

class ArticleListPresenter {
    
    weak var view: ArticleListViewProtocol!
    
    init(view: ArticleListViewProtocol) {
        self.view = view
    }
}
