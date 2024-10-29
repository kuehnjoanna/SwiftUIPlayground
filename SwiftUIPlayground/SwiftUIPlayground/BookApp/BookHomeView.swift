//
//  BookHomeView.swift
//  SwiftUIPlayground
//
//  Created by Joanna Kühn on 27.10.24.
//

import SwiftUI

struct BookHomeView: View {
    @State private var selectedTab: BookCategories = .all
    var body: some View {
        NavigationStack{
        
            ScrollView{
                VStack{
                    BookAppHeader(scrollOffset: 2, titile: "hi", profileImage: "house")
                    
                    Text("Most Read Books")
                        .font(.title)
                        .foregroundStyle(.white)
                        .padding(.bottom)
                    MostReadView()
                    BookCategoriesView(selectedCategory: $selectedTab)
                    BookView(selectedTab: $selectedTab)
                }
            }.background(.black)
        }
    }
}

#Preview {
    BookHomeView()
}
struct BookAppHeader: View{
    var scrollOffset: CGFloat
    var titile: String
    var profileImage: String//ImageResource
    var body: some View{
        ZStack{
            Color.clear
                .background(.ultraThinMaterial)
            HStack{
                Image(systemName: "ellipsis")
                    .padding()
                    .foregroundStyle(.white)
                Spacer()
                Text("Library")
                    .font(.largeTitle)
                    .foregroundStyle(.white)
                Spacer()
                Image(systemName: "person")
                    .padding()
                .foregroundStyle(.white)
            }//hstack
        }//zstack
        .padding(.vertical)
    }
}
