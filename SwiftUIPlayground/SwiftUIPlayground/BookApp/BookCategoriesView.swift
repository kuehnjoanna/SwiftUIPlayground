//
//  BookCategories.swift
//  SwiftUIPlayground
//
//  Created by Joanna Kühn on 25.10.24.
//

import Foundation
import SwiftUI


struct BookCategoriesView: View {
    @Binding var selectedCategory: BookCategories
    @State var textWidth: CGFloat = 0
    @State var textWidths: [CGFloat] = Array(repeating: 0, count: BookCategories.allCases.count)
    @State var indexInt: CGFloat = 0
    @State var hstackWidth: CGFloat = 0
    
    var body: some View{
        ScrollViewReader(content: { proxy in
        

        ScrollView(.horizontal, showsIndicators: false){
            HStack(spacing: 30){
                ForEach(BookCategories.allCases.indices,id:\.self){index in
                    let bookCategories = BookCategories.allCases[index]
                    Text(bookCategories.rawValue).font(.callout)
                        .background(
                            GeometryReader(content: { textGeowidth -> Color in
                                DispatchQueue.main.async {
                                    textWidths[index] = textGeowidth.size.width
                                }
                                return Color.clear
                            })
                        )
                        .id(index)
                        .frame(width: 70, alignment: .leading)
                        .padding(.vertical, 10)
                        .foregroundColor(selectedCategory == bookCategories ? .gray : .red)
                        .onTapGesture {
                            withAnimation{
                                indexInt = CGFloat(index)
                                selectedCategory = bookCategories
                                textWidth = textWidths[index]
                            }
                            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1){
                                withAnimation{
                                    proxy.scrollTo(index, anchor: .center)
                                }
                            }
                         
                        }
                }
            }//HSTACK
            .background(
                GeometryReader(content: { geometry in
                    Capsule()
                        .foregroundStyle(.gray.opacity(0.6))
                        .frame(width: textWidth + 30)
                        .offset(x: indexInt * 100)
                        .offset(x: -15)
                })
            )
            .padding()
        }//SCROLLVIEW
        .onAppear(){
            if textWidth == 0 {
                DispatchQueue.main.asyncAfter(deadline: .now() + 0.1){
                    textWidth = textWidths[0]
                }
            }
        }
        })
    }
}


//#Preview {
//    BookCategoriesView()
//}
enum BookCategories: String, CaseIterable{
    case all = "all"
    case fiction = "fiction"
    case mystery = "mystery"
    case romance = "romance"
    case action = "action"
}

