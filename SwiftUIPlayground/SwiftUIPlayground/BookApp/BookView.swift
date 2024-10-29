//
//  BookView.swift
//  SwiftUIPlayground
//
//  Created by Joanna Kühn on 27.10.24.
//

import SwiftUI

struct Books: View {
    var theBook: BookModel
    var body: some View {
        Image(theBook.imageName)
            .resizable()
            .scaledToFill()
            .frame(width: 176, height: 260)
            .clipShape(.rect(cornerRadius: 12))
            .overlay(alignment: .bottom){
                UnevenRoundedRectangle(bottomLeadingRadius: 12, bottomTrailingRadius: 12)
                    .frame(height: 40)
                    .foregroundStyle(LinearGradient(gradient: Gradient(colors: [.black, .clear]), startPoint: .leading, endPoint: .trailing))
                Text(theBook.title).bold()
                    .foregroundColor(.white)
                    .frame(width: 150, alignment: .leading)
            }
            .overlay(alignment: .topTrailing){
                HStack(spacing: 2){
                    Image(systemName: "star.fill")
                        .foregroundStyle(.purple)
                    Text("\(theBook.rating,specifier: "%.1f" )")
                        .foregroundStyle(.black)
                }//HSTACK
                .offset(x: -1)
                .font(.system(size: 11))
                .frame(width: 44 , height: 22)
                .background(.white, in: .rect(cornerRadius: 20))
                .padding(10)
            }
    }
}

struct BookView: View{
    @Binding var selectedTab: BookCategories
    var vm = BookDataManager.shared
    var currentBooks: [BookModel] {
        if let category = vm.categories.first(where: {$0.name.lowercased() == selectedTab.rawValue}){
            return category.books
        } else {
            return vm.categories.first?.books ?? []
        }
    }
    var body: some View{
        LazyVGrid(columns: Array(repeating: GridItem(), count: 2), content: {
            ForEach(currentBooks, id: \.title){book in
                NavigationLink {
                    SelectedView(theBook: book)
                } label: {
                    Books(theBook: book)
                }
            }
        })
    }
}

#Preview {
    //    Books(theBook: BookModel(title: "sdbhjsa", imageName: "collars", rating: 45, description: "gfjudysgua", story: "gfbiweygfla"))
    BookView(selectedTab: .constant(.all))
    
}