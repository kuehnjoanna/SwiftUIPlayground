//
//  ActivityView.swift
//  SwiftUIPlayground
//
//  Created by Joanna Kühn on 08.10.24.
//

import SwiftUI

struct ActivityView: View {
    var ProfilePostData: [ProfilePostModel] = [
        ProfilePostModel(image: "dog1", type: "multiple"),
        ProfilePostModel(image: "dog2", type: "video"),
        ProfilePostModel(image: "dog3", type: "multiple"),
        ProfilePostModel(image: "dog4", type: "video"),
        ProfilePostModel(image: "dog5", type: "multiple"),
        ProfilePostModel(image: "dog6", type: "video"),
        ProfilePostModel(image: "dog7", type: "multiple"),
        ProfilePostModel(image: "dog8", type: "video"),
        ProfilePostModel(image: "doggo", type: "multiple")
    ]
    var body: some View {
        VStack(alignment: .center, spacing: 0){
            Divider()
            Spacer()
                .frame(height: 50)
            Text("Dogstagram")
                .font(.largeTitle.bold())
                .foregroundColor(.red)
            Divider()
        
            VStack(alignment: .leading){
                UserInfoView()
                Text("Doglove - Fan Page")
                    .font(Font.system(size: 13, weight: .medium))
                    .padding(.top, 5)
                    .padding(.bottom, 1)
                Text("🐕Dog Page\n🇩🇪 Made in Germany\n🥜 Peanut butter and cuddles")
                    .font(Font.system(size: 13, weight: .regular))
                Text("\ngithub.com/kuehnjoanna")
                    .font(Font.system(size: 13, weight: .medium))
                    .foregroundColor(Color(red:9/255, green:55/255, blue:107/255))
                ProfileActionsView()
                    .padding(.top, 10)
                HighlightView()
                    Divider()
                PostGridView(data: ProfilePostData)
            }//: VSTACK
            .padding(.horizontal, 15)
            .padding(.vertical, 10)
        }
    }
}
struct PostGridView: View {
    
    let gridLayout:[GridItem] =  Array(repeating: .init(.flexible(), spacing:2), count: 3)
    
    let data: [ProfilePostModel]
    
    
    var body: some View {
        LazyVGrid(columns: gridLayout, spacing:2){
            ForEach(data) { item in
                Image(item.image)
                    .resizable()
                    .scaledToFill()
                    .frame(height: (UIScreen.main.bounds.width - 8) / 3)
                    .clipped()
                    .overlay(
                        ZStack{
                            Image(item.type == "video" ? "video" : "multiple")
                                .resizable()
                                .scaledToFill()
                                .frame(width: 28, height: 28)
                                .padding(5)
                        }
                        , alignment: .topTrailing
                    )
            }
        }
    }
}

#Preview {
    ActivityView()
}
