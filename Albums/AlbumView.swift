//
//  AlbumView.swift
//  MyFavoriteBands
//
//  Created by Brent Beamer on 11/23/23.
//

import SwiftUI

struct AlbumView: View {
    
    let album: Album
    
    var body: some View {
        ScrollView {
            VStack {
                Image(album.id)
                    .resizable()
                    .scaledToFit()
                
                Text("About")
                    .font(.custom("SpecialElite-Regular", size: 26).bold())
                    .foregroundStyle(.black.opacity(0.9))
                    .padding(.bottom, 5)
                
                Text(album.description)
                    .font(.custom("SpecialElite-Regular", size: 18).bold())
                    .foregroundStyle(.black.opacity(0.7))
                    .padding()
                
                CustomDivider()
                
                Text("Track Listing")
                    .font(.custom("SpecialElite-Regular", size: 26).bold())
                    .foregroundStyle(.black.opacity(0.9))
                    .padding(.bottom, 5)
                
                Text(album.tracks)
                    .font(.custom("SpecialElite-Regular", size: 18).bold())
                    .foregroundStyle(.black.opacity(0.7))
                    .padding()
                
                Text("All information courtesy of Wikipedia.com")
                    .font(.custom("SpecialElite-Regular", size: 10).bold())
                    .foregroundStyle(.black.opacity(0.5))
            }
        }
        .background(.darkBackground)
        .navigationTitle(album.name)
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    let albums: [String: Album] = Bundle.main.decode("albums.json")
   return AlbumView(album: albums["Californication"]!)
}
