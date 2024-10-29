//
//  CardBraidModel.swift
//  SwiftUIPlayground
//
//  Created by Joanna Kühn on 28.10.24.
//

import Foundation
import SwiftUI

struct CardBraidModel: Identifiable,  Hashable{
    var id: UUID = UUID()
    var color: Color
}

var cardColors: [CardBraidModel] = [
    .init(color: .orange),
    .init(color: .blue),
    .init(color: .gray),
    .init(color: .yellow),
    .init(color: .black),
    .init(color: .purple)
]

