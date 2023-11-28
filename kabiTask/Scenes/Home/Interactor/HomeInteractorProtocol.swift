//
//  HomeInteractorProtocol.swift
//  kabiTask
//
//  Created by Essam Orabi on 27/11/2023.
//

import Foundation

protocol HomeInteractorProtocol {
    func getPostsData(from url: URL, completion: @escaping ([Post]?, Error?) -> Void)
}
