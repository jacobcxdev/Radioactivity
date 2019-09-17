//
//  Section.swift
//  Radioactivity
//
//  Created by Jacob Clayden on 16/09/2019.
//  Copyright © 2019 Jacob Clayden. All rights reserved.
//

import SwiftUI

class Section: Identifiable {
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
}
