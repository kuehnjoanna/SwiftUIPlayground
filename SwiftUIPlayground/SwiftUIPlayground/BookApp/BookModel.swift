//
//  BookModel.swift
//  SwiftUIPlayground
//
//  Created by Joanna Kühn on 27.10.24.
//

import Foundation
struct BookModel{
    var title: String
    var imageName: String
    var rating: Double
    var description: String
    var story: String
}

struct BookCategory{
    var name: String
    var books: [BookModel]
}
