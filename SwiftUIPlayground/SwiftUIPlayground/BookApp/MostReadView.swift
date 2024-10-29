//
//  MostReadView.swift
//  SwiftUIPlayground
//
//  Created by Joanna Kühn on 27.10.24.
//

import SwiftUI

struct MostReadView: View {
    var vm = BookDataManager.shared
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack{
                ForEach( vm.mostReadBooks, id:\.title){ book in
                    NavigationLink{
                        SelectedView(theBook: book)
                    } label: {
                        MostRead(theBook: book)
                    }
                }
            }//HSTACK
        }//SCROLLVIEW
    }
}

#Preview {
    MostReadView()
}
struct MostRead: View {
    var theBook: BookModel
    var body: some View{
        Image(theBook.imageName)
            .resizable()
            .scaledToFill()
            .frame(width: 120, height: 160)
            .clipShape(.rect(cornerRadius: 12))
            .overlay(alignment: .topTrailing){
                HStack(spacing: 2){
                    Image(systemName: "star.fill")
                        .foregroundStyle(.purple)
                    Text("\(theBook.rating, specifier: "%.1f")")
                        .foregroundStyle(.black)
                }//HSTACK
                .offset(x: -1)
                .font(.system(size: 8))
                .frame(width: 35, height: 15)
                .background(.white, in: .rect(cornerRadius: 20))
                .padding(6)
            }
    }
}
