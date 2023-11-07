//
//  Post.swift
//  Networking One
//
//  Created by Bambang Tri Rahmat Doni on 07/11/23.
//

import Foundation

struct Post: Codable, Identifiable {
    enum CodingKeys: String, CodingKey {
        case postId = "id"
        case title = "title"
        case body = "body"
        case userId = "userId"
    }
    
    let id = UUID()
    
    let postId: Int
    let title: String
    let body: String
    let userId: Int
    
    init(postId: Int, title: String, body: String, userId: Int) {
        self.postId = postId
        self.title = title
        self.body = body
        self.userId = userId
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(self.postId, forKey: .postId)
        try container.encode(self.title, forKey: .title)
        try container.encode(self.body, forKey: .body)
        try container.encode(self.userId, forKey: .userId)
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.postId = try container.decode(Int.self, forKey: .postId)
        self.title = try container.decode(String.self, forKey: .title)
        self.body = try container.decode(String.self, forKey: .body)
        self.userId = try container.decode(Int.self, forKey: .userId)
    }
}
