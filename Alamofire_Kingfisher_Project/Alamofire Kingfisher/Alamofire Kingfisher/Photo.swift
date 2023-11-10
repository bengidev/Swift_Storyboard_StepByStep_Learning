//
//  Photo.swift
//  Alamofire Kingfisher
//
//  Created by Bambang Tri Rahmat Doni on 08/11/23.
//

import Foundation

struct Photo: Identifiable, Codable {
    enum CodingKeys: CodingKey {
        case title, url, thumbnailUrl
    }
    
    var id = UUID()
    let title: String
    let url: String
    let thumbnailUrl: String
    
    init(title: String, url: String, thumbnailUrl: String) {
        self.title = title
        self.url = url
        self.thumbnailUrl = thumbnailUrl
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(self.title, forKey: .title)
        try container.encode(self.url, forKey: .url)
        try container.encode(self.thumbnailUrl, forKey: .thumbnailUrl)
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        self.title = try container.decode(String.self, forKey: .title)
        self.url = try container.decode(String.self, forKey: .url)
        self.thumbnailUrl = try container.decode(String.self, forKey: .thumbnailUrl)
    }
}
