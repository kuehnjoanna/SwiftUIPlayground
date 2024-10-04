//
//  SearchEntry.swift
//  SwiftUIPlayground
//
//  Created by Joanna Kühn on 04.10.24.
//

import Foundation
struct SearchEntry: Codable {
    var resultCount: Int
    var results: [Results]
}
struct Results: Codable {
    var artistId: Int
    var artistName: String
    var trackName: String
    var artistViewUrl: String
    var trackViewUrl: String
    var artworkUrl100: String
    
}
