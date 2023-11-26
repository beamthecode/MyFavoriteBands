//
//  BandView.swift
//  MyFavoriteBands
//
//  Created by Brent Beamer on 11/22/23.
//

import SwiftUI

struct BandView: View {
    
    struct BandMember {
        let role: String
        let musician: Musician
    }
    
    struct BandAlbums {
        let year: String
        let album: Album
       
    }
    
    let band: Band
    let members: [BandMember]
    let essentialAlbums: [BandAlbums]
    
    
    var body: some View {
        GeometryReader { geometry in
            ScrollView {
                VStack {
                    Image(band.image)
                        .resizable()
                        .scaledToFit()
                        .frame(maxWidth: geometry.size.width * 0.6)
                        .padding(.vertical)
                        .accessibilityLabel(band.badge)
                    
                    
                    VStack(alignment: .leading) {
                        CustomDivider()
                        
                        Text("Bio")
                            .font(.custom("SpecialElite-Regular", size: 28).bold())
                            .foregroundStyle(.black.opacity(0.9))
                            .padding(.bottom, 5)
                        
                        Text(band.description)
                            .font(.custom("SpecialElite-Regular", size: 18).bold())
                            .foregroundStyle(.black.opacity(0.7))
                            .padding()
                        
                        Text("All information courtesy of Wikipedia.com")
                            .font(.custom("SpecialElite-Regular", size: 10).bold())
                            .foregroundStyle(.black.opacity(0.5))
                        
                       CustomDivider()
                        
                        Text("Members")
                            .font(.custom("SpecialElite-Regular", size: 28).bold())
                            .foregroundStyle(.black.opacity(0.9))
                            .padding(.bottom, 5)
                        
                    }
                    .padding(.horizontal)
                    
                    
                      BandRoster(members: members)
                    
                      CustomDivider()
                    
                        Text("Essential Albums")
                            .font(.custom("SpecialElite-Regular", size: 28).bold())
                            .foregroundStyle(.black.opacity(0.9))
                            .padding(.bottom, 5)
                    
                    
                     AlbumRoster(albums: essentialAlbums)
                }
                .padding(.bottom)
            }
        }
        .navigationTitle(band.displayName)
        .navigationBarTitleDisplayMode(.inline)
        .background(.darkBackground)
    }
    
    init(band: Band, musicians: [String: Musician], albums: [String: Album]) {
        self.band = band
        
        self.members = band.bandMembers.map { member in
            if let musician = musicians[member.name] {
                return BandMember(role: member.role, musician: musician)
            } else {
                fatalError("Missing \(member.name)")
            }
        }
        self.essentialAlbums = band.albums.map { essentialAlbum in
            if let album = albums[essentialAlbum.name] {
                return BandAlbums(year: essentialAlbum.year, album: album)
            } else {
                fatalError("Missing \(essentialAlbum.name)")
            }
        }
    }
}
   

#Preview {
     let bands: [Band] = Bundle.main.decode("bands.json")
     let musicians: [String: Musician] = Bundle.main.decode("musicians.json")
     let albums: [String: Album] = Bundle.main.decode("albums.json")
     
    return BandView(band: bands[0], musicians: musicians, albums: albums)
        .preferredColorScheme(.dark)
}
