//
//  ContentView.swift
//  Radioactivity
//
//  Created by Jacob Clayden on 16/09/2019.
//  Copyright © 2019 Jacob Clayden. All rights reserved.
//

import SwiftUI
import SwiftyJSON
import URLImage

struct ContentView: View {
    let sections: [Section]
    
    var body: some View {
        NavigationView {
            List(sections) { section in
                NavigationLink(destination: SectionDetail(section: section)) {
                    SectionView(section: section)
                }
            }
            .navigationBarTitle("Radioactivity")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        if let json = try? JSON(data: Data(contentsOf: Bundle.main.url(forResource: "data", withExtension: "json")!)) {
            var sections = [Section]()
            for (_, section):(String, JSON) in json {
                sections.append(Section(id: section["id"].intValue, title: section["title"].stringValue, description: section["description"].stringValue, content: section["content"].stringValue, imageURL: section["imageURL"].stringValue, imageBackground: section["imageBackground"].boolValue))
            }
            return ContentView(sections: sections)
        }
        return ContentView(sections: [])
    }
}

struct SectionView: View {
    @State private var showImageBackground = false
    var section: Section
    
    var body: some View {
        VStack {
            HStack {
                if section.imageURL.isEmpty {
                    Image(systemName: "photo")
                } else {
                    URLImage(URL(string: section.imageURL)!, placeholder: Image(systemName: "photo"), configuration: .init(useInMemoryCache: true), completion: { image in
                        self.showImageBackground = true
                        self.section.uiimage = image
                    })
                        .resizable()
                        .scaledToFit()
                        .frame(width: 100)
                        .padding(section.imageBackground && showImageBackground ? 5 : 0)
                        .scaledToFit()
                        .frame(width: 100)
                        .background(section.imageBackground && showImageBackground ? Color(.white) : nil)
                        .cornerRadius(10)
                }
                VStack(alignment: .leading, spacing: 10) {
                    Text(section.title)
                        .font(.headline)
                    Text(section.description)
                        .font(.caption)
                        .foregroundColor(.secondary)
                }
                .padding()
            }
        }
    }
}
