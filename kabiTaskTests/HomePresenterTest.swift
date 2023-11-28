//
//  HomePresenterTest.swift
//  kabiTask
//
//  Created by Essam Orabi on 27/11/2023.
//

import XCTest
@testable import kabiTask
class HomePresenterTest: XCTestCase {

    var sut: HomePresenter!
    var viewControllerMock: HomeViewMock!
    var postsList = [Post]()

    override func setUp() {
        super.setUp()
        viewControllerMock = HomeViewMock()
        sut = HomePresenter(view: viewControllerMock)
        let post1 = Post(userID: 1, id: 1, title: "title1", body: "body1")
        let post2 = Post(userID: 2, id: 2, title: "title2", body: "body2")
        postsList.append(contentsOf: [post1, post2])
        sut.postsData = postsList
    }

    override func tearDown() {
        sut = nil
        super.tearDown()
    }

    func testNumberOfImages() {
        let postCount = sut.getPostsCount()
        XCTAssertEqual(postCount, 2)
    }

    func testDidSelectItem() {
        sut.didSelectItemAt(index: 0)
        XCTAssertEqual(viewControllerMock.post.title, "title1")
        XCTAssertEqual(viewControllerMock.isNavigatedToDetails, true)
    }
    
}
