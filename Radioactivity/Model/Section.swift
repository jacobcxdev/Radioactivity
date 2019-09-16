//
//  Section.swift
//  Radioactivity
//
//  Created by Jacob Clayden on 16/09/2019.
//  Copyright © 2019 Jacob Clayden. All rights reserved.
//

import SwiftUI

class Section: Identifiable, Codable {
    let id: Int
    
    var title: String = ""
    var description: String = ""
    var content: String = ""
    var imageURL: String = ""
    var imageBackground: Bool = false
    var uiimage: UIImage?
    
    init(id: Int = 0) {
        self.id = id
    }
    
    init(id: Int, title: String, description: String, content: String, imageURL: String, imageBackground: Bool, uiimage: UIImage? = nil) {
        self.id = id
        self.title = title
        self.description = description
        self.content = content
        self.imageURL = imageURL
        self.imageBackground = imageBackground
        self.uiimage = uiimage
    }
    
    enum CodingKeys: String, CodingKey {
        case id = "id"
        case title = "title"
        case description = "description"
        case content = "content"
        case imageURL = "imageURL"
        case imageBackground = "imageBackground"
        case uiimage = "uiimage"
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        try container.encode(id, forKey: .id)
        try container.encode(title, forKey: .title)
        try container.encode(description, forKey: .description)
        try container.encode(content, forKey: .content)
        try container.encode(imageURL, forKey: .imageURL)
        try container.encode(imageBackground, forKey: .imageBackground)
        try container.encode(uiimage?.pngData(), forKey: .uiimage)
    }
    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        id = try container.decode(Int.self, forKey: .id)
        title = try container.decode(String.self, forKey: .title)
        description = try container.decode(String.self, forKey: .description)
        content = try container.decode(String.self, forKey: .content)
        imageURL = try container.decode(String.self, forKey: .imageURL)
        imageBackground = try container.decode(Bool.self, forKey: .imageBackground)
        uiimage = try container.decode(UIImage.self, forKey: .uiimage)
    }
}
