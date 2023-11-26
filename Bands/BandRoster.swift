//
//  BandRoster.swift
//  MyFavoriteBands
//
//  Created by Brent Beamer on 11/22/23.
//

import SwiftUI

struct BandRoster: View {
    let members: [BandView.BandMember]
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(members, id: \.role) { bandMember in
                    NavigationLink {
                        MusicianView(musician: bandMember.musician)
                    } label: {
                        HStack {
                            Image(bandMember.musician.id)
                                .resizable()
                                .frame(width: 104, height: 72)
                                .clipShape(Rectangle())
                                .overlay(
                                    Rectangle()
                                        .strokeBorder(.white, lineWidth: 1))
                            VStack(alignment: .leading) {
                                Text(bandMember.musician.name)
                                    .font(.custom("SpecialElite-Regular", size: 15).bold())
                                    .foregroundStyle(.black.opacity(0.6))
                                    .accessibilityLabel(bandMember.musician.name.replacingOccurrences(of: ".", with: " "))
                                Text(bandMember.role)
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
    BandRoster(members: [])
}
