//
//  SelectedView.swift
//  SwiftUIPlayground
//
//  Created by Joanna Kühn on 27.10.24.
//

import SwiftUI

struct SelectedView: View {
    var theBook: BookModel
    var body: some View {
        ZStack{
            GeometryReader(content: { geometry in
                Image(theBook.imageName)
                    .resizable()
                    .scaledToFill()
                    .frame(width: geometry.size.width, height: geometry.size.height)
            })
            VStack(alignment: .leading, spacing: 24){
                Text(theBook.title).font(.title).bold()
                    .foregroundStyle(.white)
                HStack{
                    Text("Auhor")
                    line()
                    Text("Published on 22.12.1988")
                }//hstack
                .foregroundStyle(.secondary)
                HStack{
                    VStack(alignment: .center, spacing: 15){
                        Text("Rating").foregroundStyle(.secondary)
                        Text(String(theBook.rating)).bold()
                    }
                    line()
                    VStack(alignment: .center, spacing: 15){
                        Text("Likes").foregroundStyle(.secondary)
                        Text("1324").bold()
                    }
                    line()
                    VStack(alignment: .center, spacing: 15){
                        Text("Pages").foregroundStyle(.secondary)
                        Text("324").bold()
                    }
                }//hstack
                Text("About \(theBook.title)").font(.title).bold().foregroundStyle(.white)
                Text(theBook.description)
                    .foregroundStyle(.secondary)
                    .lineLimit(20)
            }//VSTACK
            .padding()
            .padding(.vertical, 20)
            .padding(.bottom, 60)
            .background(.ultraThinMaterial)
            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: .bottom)
            .overlay(alignment: .bottom){
                Button(action: {
                    withAnimation{
                        
                    }
                }, label: {
                    Text("Start Reading").bold()
                        .frame(width: 250, height: 50)
                        .background(.white, in: .capsule)
                        .foregroundStyle(.black)
                })
                .padding(.bottom, 26)
            }
        }//ZSTACK
        .ignoresSafeArea()
    }
}

#Preview {
    SelectedView(theBook: BookModel(title: "TITLE", imageName: "pb", rating: 3.0, description: "sdisadsjk", story: "ndsiadhuiahdliud"))
}
struct line: View {
    var body: some View{
        Rectangle()
            .frame(width: 1, height: 35)
    }
}
