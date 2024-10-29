//
//  HighlightView.swift
//  SwiftUIPlayground
//
//  Created by Joanna Kühn on 08.10.24.
//

import SwiftUI

struct HighlightView: View {

    var highlightData: [HighlightDataModel] = [
        HighlightDataModel(name: "Dog Treats", cover: "treats"),
        HighlightDataModel(name: "Best Collars", cover: "collars"),
        HighlightDataModel(name: "Tricks", cover: "tricks"),
        HighlightDataModel(name: "Peanut Butter", cover: "pb"),
        HighlightDataModel(name: "Trip I", cover: "beach"),
        HighlightDataModel(name: "Puppy", cover: "puppy"),
        HighlightDataModel(name: "Trip II", cover: "Forest")
    ]
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false){
            HStack(alignment: .center, spacing: 10){
                ForEach(highlightData) { item in
                    VStack(alignment: .center, spacing: 8){
                        ZStack {
                            Image(item.cover)
                                .resizable()
                                .scaledToFill()
                                .frame(width: 58, height: 58, alignment: .center)
                                .clipShape(Circle())
                            
                            Circle().stroke(Color(red: 220/255, green: 220/255, blue: 220/255) , style: StrokeStyle(lineWidth: 1, lineCap: .round))
                                .frame(width: 68, height: 68, alignment: .center)
                        }//: ZSTACK
                    
                        Text(item.name)
                            .lineLimit(1)
                            .font(Font.system(size: 12, weight: .regular))
                            .frame(width: 75)
                            .foregroundColor(.primary)
                    }//: VSTACK
                }//: LOOP
            }//: HSTACK
            .padding(.horizontal, 15)
            .padding(.vertical, 10)
        }//: SCROLL
    }
}

#Preview {
    HighlightView()
}
