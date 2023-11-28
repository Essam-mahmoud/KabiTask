//
//  HomeVC+PresenterDelegate.swift
//  kabiTask
//
//  Created by Essam Orabi on 27/11/2023.
//

import UIKit

extension HomeVC: HomeViewProtocol {
    func reloadData() {
        DispatchQueue.main.async {
            self.postsTableView.reloadData()
        }
    }
    
    func showIndicator() {
        DispatchQueue.main.async {
            self.activityIndicator.startAnimating()
        }
    }
    
    func hideIndicator() {
        DispatchQueue.main.async {
            self.activityIndicator.stopAnimating()
            self.activityIndicator.removeFromSuperview()
        }
    }
    
    func fetchingDataSuccess() {
        DispatchQueue.main.async {
            self.postsTableView.reloadData()
        }
    }
    
    func showError(error: String) {
        self.showAlert(message: error, title: "Error")
    }
    
    func navigateToDetailsPage(with post: Post) {
        let editViewController = UIStoryboard(name: "Main", bundle:nil).instantiateViewController(withIdentifier: "EditPostVC") as! EditPostVC
        editViewController.post = post
        editViewController.delegate = self
        self.navigationController?.pushViewController(editViewController, animated: true)
    }
}

extension HomeVC: EditPostProtocol {
    func savePostChanges(post: Post) {
        presenter.changePostData(newPost: post)
    }
}
