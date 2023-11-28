//
//  PostModel.swift
//  kabiTask
//
//  Created by Essam Orabi on 27/11/2023.
//

import Foundation

struct Post: Codable {
    var userID, id: Int?
    var title, body: String?

    enum CodingKeys: String, CodingKey {
        case userID = "userId"
        case id, title, body
    }
}
