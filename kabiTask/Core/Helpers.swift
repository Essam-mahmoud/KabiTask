//  GoLyv
//
//  Created by Essam Orabi on 20/10/2023.
//


import Foundation

struct Constants {
    static let baseURL = "https://jsonplaceholder.typicode.com"
    static let posts = baseURL + "/posts"
}

enum APIError: Error {
    case failedTogetData
}
