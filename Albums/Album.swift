//
//  Album.swift
//  MyFavoriteBands
//
//  Created by Brent Beamer on 11/23/23.
//

import Foundation

struct Album: Codable, Identifiable {
    let id: String
    let name: String
    let description: String
    let tracks: String
}
