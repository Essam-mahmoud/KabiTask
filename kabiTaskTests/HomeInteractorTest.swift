//
//  HomeInteractorTest.swift
//  kabiTask
//
//  Created by Essam Orabi on 27/11/2023.
//

import XCTest
@testable import kabiTask

class HomeInteractorTest: XCTestCase {

    var sut: HomeInteractor!

    override func setUp() {
        super.setUp()
        sut = HomeInteractor()
    }

    override func tearDown() {
        sut = nil
        super.tearDown()
    }

    func testFetchCarImages() {
        let promise = XCTestExpectation(description: "Fetch posts completed")
        var responseError: Error?
        var responsePosts: [Post]?

        guard let bundle = Bundle.unitTest.path(forResource: "stubs", ofType: "json") else {
            XCTFail("Error: content not found")
            return
        }

        sut.getPostsData(from: URL(fileURLWithPath: bundle)) { postsList, error in
            if error == nil {
                if let posts = postsList {
                    responsePosts = posts
                }
            } else {
                responseError = error
            }
            promise.fulfill()
        }
        wait(for: [promise], timeout: 1)
        XCTAssertNil(responseError)
        XCTAssertNotNil(responsePosts)
    }
}
