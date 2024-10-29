//
//  UserInfoView.swift
//  SwiftUIPlayground
//
//  Created by Joanna Kühn on 08.10.24.
//

import SwiftUI

struct UserInfoView: View {
    var body: some View {
        HStack(alignment: .center){
            ZStack{
                Image("doggo")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 90, height: 90)
                    .clipShape(Circle())
                ZStack{
                    Circle()
                        .fill(Color.blue)
                        .frame(width: 25, height: 25)
                    
                    Image(systemName: "plus")
                        .font(Font.system(size: 16, weight: .bold))
                        .foregroundColor(.white)
                    
                    Circle().stroke(Color.white, lineWidth: 2)
                        .frame(width: 25, height: 25)
                }
                .offset(x: 35, y: 30)
            }
            
            Spacer()
            
            HStack(alignment: .center, spacing:30){
                VStack(alignment: .center, spacing: 0){
                    Text("71")
                        .font(Font.system(size: 17, weight: .medium))
                    Text("Posts")
                        .font(.footnote)
                }
                
                VStack(alignment: .center, spacing: 0){
                    Text("1,078")
                        .font(Font.system(size: 17, weight: .medium))
                    Text("Followers")
                        .font(.footnote)
                }
                
                VStack(alignment: .center, spacing: 0){
                    Text("83")
                        .font(Font.system(size: 17, weight: .medium))
                    Text("Following")
                        .font(.footnote)
                }
            }
            Spacer()
                .frame(width: 20)
        }
    }
}

#Preview {
    UserInfoView()
}
