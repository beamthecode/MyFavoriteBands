//
//  GridLayout.swift
//  MyFavoriteBands
//
//  Created by Brent Beamer on 11/22/23.
//

import SwiftUI

struct GridLayout: View {
    
    let musicians: [String: Musician]
    let bands: [Band]
    let albums: [String: Album]
    
    let columns = [
        GridItem(.adaptive(minimum: 150))
    ]
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns) {
                ForEach(bands) { band in
                    NavigationLink {
                        BandView(band: band, musicians: musicians, albums: albums)
                    } label: {
                        VStack {
                            Image(band.image)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 100, height: 100)
                                .padding()
                            
                            VStack {
                                Text(band.displayName)
                                    .font(.custom("SpecialElite-Regular", size: 17).bold())
                                    .foregroundStyle(.black.opacity(0.8))
                                
                            }
                            .padding(.vertical)
                            .frame(maxWidth: .infinity)
                            .background(.lightBackground)
                        }
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .overlay(RoundedRectangle(cornerRadius: 10)
                            .stroke(.lightBackground)
                        )
                    }
                }
            }
            .padding([.horizontal, .bottom])
        }
    }
}

#Preview {
    GridLayout(musicians: Bundle.main.decode("musicians.json"), bands: Bundle.main.decode("bands.json"), albums: Bundle.main.decode("albums.json"))
        .preferredColorScheme(.dark)
}
