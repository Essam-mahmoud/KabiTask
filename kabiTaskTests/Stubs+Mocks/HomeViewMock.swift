//
//  HomeViewMock.swift
//  kabiTask
//
//  Created by Essam Orabi on 27/11/2023.
//

import Foundation
@testable import kabiTask
// The mock HomeViewMock object doesn’t connect to the real server,
// it’s an object designed only for the test.

class HomeViewMock: HomeViewProtocol{

    var isNavigatedToDetails = false
    var post: Post!
    func navigateToDetailsPage(with post: Post) {
        isNavigatedToDetails = true
        self.post = post
    }
    
    func reloadData() {}
    
    func showIndicator() {}

    func hideIndicator() {}

    func fetchingDataSuccess() {}

    func showError(error: String) {}
}
