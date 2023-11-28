//
//  HomePresenter.swift
//  kabiTask
//
//  Created by Essam Orabi on 27/11/2023.
//

import Foundation

// Protocol have the main features for do changes in Home View
protocol HomeViewProtocol: AnyObject {
    func showIndicator()
    func hideIndicator()
    func fetchingDataSuccess()
    func showError(error: String)
    func reloadData()
    func navigateToDetailsPage(with post: Post)
}

class HomePresenter {
    private weak var view: HomeViewProtocol?
    private let interactor = HomeInteractor()
    var postsData = [Post]()
    
    init(view: HomeViewProtocol) {
        self.view = view
    }
    
    func getPostsData() {
        view?.showIndicator()
        guard let url = URL(string: Constants.posts) else {return}
        interactor.getPostsData(from: url) { [weak self] result, error in
            guard let self = self else {return}
            self.view?.hideIndicator()
            if error == nil {
                if let posts = result {
                    self.postsData = posts
                    self.view?.fetchingDataSuccess()
                }
            } else {
                self.view?.showError(error: error?.localizedDescription ?? "")
            }
        }
    }
    
    func getPostsCount() -> Int {
        return postsData.count
    }
    
    func didSelectItemAt(index: Int) {
        view?.navigateToDetailsPage(with: postsData[index])
    }
    
    func changePostData(newPost: Post) {
        for (index, post) in postsData.enumerated() {
            if post.id == newPost.id {
                postsData[index].title = newPost.title
                postsData[index].body = newPost.body
            }
        }
        
        view?.reloadData()
    }
    
    // function to configure the cell
    func configure(cell: PostCellProtocol, for index: Int) {
        cell.displayData(data: postsData[index])
    }
}

