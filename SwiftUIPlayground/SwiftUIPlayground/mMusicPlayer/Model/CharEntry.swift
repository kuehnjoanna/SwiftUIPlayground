//
//  CharEntry.swift
//  SwiftUIPlayground
//
//  Created by Joanna Kühn on 04.10.24.
//

import Foundation
struct CharEntry: Codable {
    var feed: Feed
}

struct Feed: Codable {
var results: [Result]
}

struct Result: Codable, Identifiable {
    var artistName: String
    var id: String
    var name: String
    var artworkUrl100: String
    var url: String
}
