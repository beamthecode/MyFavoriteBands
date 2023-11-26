//
//  Musician.swift
//  MyFavoriteBands
//
//  Created by Brent Beamer on 11/21/23.
//

import Foundation

struct Musician: Codable, Identifiable {
    let id: String
    let name: String
    let description: String
}
