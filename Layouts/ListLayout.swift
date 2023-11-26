//
//  ListLayout.swift
//  MyFavoriteBands
//
//  Created by Brent Beamer on 11/22/23.
//

import SwiftUI

struct ListLayout: View {
    
    let musicians: [String: Musician]
    let bands: [Band]
    let albums: [String: Album]
    
    var body: some View {
        List(bands) { band in
            NavigationLink {
                BandView(band: band, musicians: musicians, albums: albums)
            } label: {
                HStack {
                    Image(band.image)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 40, height: 40)
                        .padding()
                    
                    VStack(alignment: .leading) {
                        Text(band.displayName)
                            .font(.custom("SpecialElite-Regular", size: 17).bold())
                            .foregroundStyle(.black.opacity(0.8))
                        
                    }
                }
            }
            .listRowBackground(Color.darkBackground)
        }
        .listStyle(.plain)
    }
}

#Preview {
    ListLayout(musicians: Bundle.main.decode("musicians.json"), bands: Bundle.main.decode("bands.json"), albums: Bundle.main.decode("albums.json"))
        .preferredColorScheme(.dark)
}
