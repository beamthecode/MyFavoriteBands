//
//  ContentView.swift
//  MyFavoriteBands
//
//  Created by Brent Beamer on 11/21/23.
//

import SwiftUI

 

struct ContentView: View {
    
    let musicians: [String: Musician] = Bundle.main.decode("musicians.json")
    let bands: [Band] = Bundle.main.decode("bands.json")
    let albums: [String: Album] = Bundle.main.decode("albums.json")
    
    @AppStorage("showingGrid") private var showingGrid = true
    
    var body: some View {
        NavigationStack {
            Group {
                if showingGrid {
                    GridLayout(musicians: musicians, bands: bands, albums: albums)
                } else {
                    ListLayout(musicians: musicians, bands: bands, albums: albums)
                }
            }
            .toolbar {
                Button {
                    showingGrid.toggle()
                } label: {
                    if showingGrid {
                        Label("Show as table", systemImage: "list.dash")
                    } else {
                        Label("Show as grid", systemImage: "square.grid.2x2")
                    }
                }
            }
            .navigationTitle("MyFavoriteBands")
            .background(.darkBackground)
            .preferredColorScheme(.dark)
           
        }
        
    }
}

#Preview {
    ContentView()
}
