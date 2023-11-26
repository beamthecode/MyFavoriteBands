//
//  Band.swift
//  MyFavoriteBands
//
//  Created by Brent Beamer on 11/21/23.
//

import Foundation


struct Band: Codable, Identifiable {
    struct BandMemberRole: Codable {
        let name: String
        let role: String
    }
    
    struct EssentialAlbum: Codable {
        let name: String
        let year: String
    }
    
    let id: String
    let bandMembers: [BandMemberRole]
    let albums: [EssentialAlbum]
    let description: String
    let badge: String
    
    
    var displayName: String {
        "\(id)"
    }
    
    var image: String {
        "\(id)"
    }
    

    
    
}
