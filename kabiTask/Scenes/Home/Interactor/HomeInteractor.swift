//
//  HomeInteractor.swift
//  kabiTask
//
//  Created by Essam Orabi on 27/11/2023.
//

import Foundation

class HomeInteractor: HomeInteractorProtocol {
    
    // function to get Data form API URL
    func getPostsData(from url: URL, completion: @escaping ([Post]?, Error?) -> Void) {
        NetworkManager.loadData(from: url, type: [Post].self) { result in
            switch result {
            case .success(let data):
                completion(data,nil)
            case .failure(let error):
                completion(nil, error)
            }
        }
    }
}
