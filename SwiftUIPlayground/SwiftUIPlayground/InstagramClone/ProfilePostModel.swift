//
//  ProfilePostModel.swift
//  SwiftUIPlayground
//
//  Created by Joanna Kühn on 08.10.24.
//

import Foundation
struct ProfilePostModel: Identifiable {
    let id = UUID()
    let image: String
    let type: String
}
