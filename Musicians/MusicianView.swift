//
//  MusicianView.swift
//  MyFavoriteBands
//
//  Created by Brent Beamer on 11/22/23.
//

import SwiftUI

struct MusicianView: View {
    let musician: Musician
    
    var body: some View {
        ScrollView {
            VStack {
                Image(musician.id)
                    .resizable()
                    .scaledToFit()
                
                Text("About")
                    .font(.custom("SpecialElite-Regular", size: 26).bold())
                    .foregroundStyle(.black.opacity(0.9))
                    .padding(.bottom, 5)
                
                Text(musician.description)
                    .font(.custom("SpecialElite-Regular", size: 18).bold())
                    .foregroundStyle(.black.opacity(0.7))
                    .padding()
                Text("All information courtesy of Wikipedia.com")
                    .font(.custom("SpecialElite-Regular", size: 10).bold())
                    .foregroundStyle(.black.opacity(0.5))
            }
        }
        .background(.darkBackground)
        .navigationTitle(musician.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}


    
    #Preview {
        let musicians: [String: Musician] = Bundle.main.decode("musicians.json")
        return MusicianView(musician: musicians["Frusciante"]!)
    }

