//
//  SectionDetail.swift
//  Radioactivity
//
//  Created by Jacob Clayden on 16/09/2019.
//  Copyright © 2019 Jacob Clayden. All rights reserved.
//

import SwiftUI

struct SectionDetail: View {
    var section: Section
    
    fileprivate func Title() -> some View {
        ZStack {
            LinearGradient(gradient: (Gradient(colors: [Color(.systemBackground), Color(.clear)])), startPoint: .bottom, endPoint: .top)
            VStack {
                Spacer()
                Text(section.title)
                    .font(.largeTitle)
                    .padding(.horizontal)
            }
        }
    }
    
    fileprivate func Header() -> some View {
        ZStack {
            Image(uiImage: self.section.uiimage!)
                .resizable()
                .padding(section.imageBackground ? 20 : 0)
                .background(Color(.white))
            VStack(alignment: .leading) {
                Spacer()
                Title()
            }
        }
    }
    
    var body: some View {
        ScrollView {
            Header()
                .scaledToFit()
            Text(section.content)
                .fixedSize(horizontal: false, vertical: true)
                .padding()
        }
        .edgesIgnoringSafeArea(.all)
        .statusBar(hidden: true)
    }
}

struct SectionDetail_Previews: PreviewProvider {
    static var previews: some View {
        SectionDetail(section: {
                let section = Section()
                section.title = "Experiments"
                section.content = "The ionising effect of each type of radiation can be investigated using an ionisation chamber and a pico ammeter. The chamber contains air at 1 atm, Ions created in the chamber are attracted to the oppositely charged electrode, where they are discharged. Electrons pass through the pico ammeter as a result of ionisation in the chamber, producing a current proportional to the number of ions created per second in the chamber.\n\nA cloud chamber contains air saturated with a vapour at a very low temperature. Due to the ionisation of the air, a charged particle passing through the cloud chamber leaves a visible track of condensed vapour droplets, as the air space is supersaturated. When an ionising particle passes through the supersaturated vapour, the ions produced trigger the formation of droplets.\n\n• α particles produce straight tracks which radiate from the source and are easily visible. The tracks from a given isotope are all of the same length, indicating that α particles have the same range.\n• β particles produce wispy tracks that are easily deflected as a result of collisions with air molecules. The tracks are not as easy to see, as β particles are less ionising than α particles."
                section.imageBackground = false
                section.uiimage = {
                    if let data = try? Data(contentsOf: URL(string: "https://i.pinimg.com/originals/5f/77/2a/5f772ae9def14bb981669dedcfca10f5.jpg")!) {
                        if let image = UIImage(data: data) {
                            return image
                        }
                    }
                    return nil
                }()
                return section
            }())
    }
}
