//
//  HomeVC.swift
//  kabiTask
//
//  Created by Essam Orabi on 27/11/2023.
//

import UIKit

class HomeVC: UIViewController {
    
    @IBOutlet weak var postsTableView: UITableView!
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    var presenter: HomePresenter!
    override func viewDidLoad() {
        super.viewDidLoad()
        setupTableView()
        presenter = HomePresenter(view: self)
        presenter.getPostsData()
    }
    
}

