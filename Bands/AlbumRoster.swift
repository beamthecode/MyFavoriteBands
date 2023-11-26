//
//  AlbumRoster.swift
//  MyFavoriteBands
//
//  Created by Brent Beamer on 11/23/23.
//

import SwiftUI

struct AlbumRoster: View {
    
    let albums: [BandView.BandAlbums]
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(albums, id: \.year) { bandAlbum in
                    NavigationLink {
                        AlbumView(album: bandAlbum.album)
                    } label: {
                        HStack {
                            Image(bandAlbum.album.id)
                                .resizable()
                                .frame(width: 104, height: 72)
                                .clipShape(Rectangle())
                                .overlay(
                                    Rectangle()
                                        .strokeBorder(.white, lineWidth: 1))
                            VStack(alignment: .leading) {
                                Text(bandAlbum.album.name)
                                    .font(.custom("SpecialElite-Regular", size: 15).bold())
                                    .foregroundStyle(.black.opacity(0.6))
                                    .accessibilityLabel(bandAlbum.album.name.replacingOccurrences(of: ".", with: " "))
                                Text(bandAlbum.year)
                                    .font(.custom("SpecialElite-Regular", size: 15).bold())
                                    .foregroundStyle(.black.opacity(0.6))
                            }
                        }
                        .padding(.horizontal)
                    }
                }
            }
        }
    }
}

#Preview {
    AlbumRoster(albums: [])
}
