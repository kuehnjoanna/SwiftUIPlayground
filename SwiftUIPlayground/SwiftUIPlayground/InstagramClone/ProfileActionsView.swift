//
//  ProfileActionsView.swift
//  SwiftUIPlayground
//
//  Created by Joanna Kühn on 08.10.24.
//

import SwiftUI

struct ProfileActionsView: View {
    var body: some View {
        VStack(alignment: .center, spacing: 8){
            HStack(alignment: .center, spacing: 8){
                Button(action:{
                    print("edit profile")
                }){
                    Text("Edit Profile")
                        .font(Font.system(size: 13, weight: .medium))
                        .padding(.vertical, 9)
                        .foregroundColor(.primary)
                        .frame(maxWidth: .infinity)
                        .overlay(
                            RoundedRectangle(cornerRadius: 3)
                                .stroke(Color(red: 210/255, green: 210/255, blue: 210/255), lineWidth: 0.7)
                        )
                }
                
                Button(action:{
                    print("Promotions")
                }){
                    Text("Promotions")
                        .font(Font.system(size: 13, weight: .medium))
                        .padding(.vertical, 9)
                        .foregroundColor(.primary)
                        .frame(maxWidth: .infinity)
                        .overlay(
                            RoundedRectangle(cornerRadius: 3)
                                .stroke(Color(red: 210/255, green: 210/255, blue: 210/255), lineWidth: 0.7)
                        )
                }
            }
            HStack(alignment: .center, spacing: 8){
                Button(action:{
                    print("insights")
                }){
                    Text("Insights")
                        .font(Font.system(size: 13, weight: .medium))
                        .padding(.vertical, 9)
                        .foregroundColor(.primary)
                        .frame(maxWidth: .infinity)
                        .overlay(
                            RoundedRectangle(cornerRadius: 3)
                                .stroke(Color(red: 210/255, green: 210/255, blue: 210/255), lineWidth: 0.7)
                        )
                }
                
                Button(action:{
                    print("shop")
                }){
                    Text("Add Shop")
                        .font(Font.system(size: 13, weight: .medium))
                        .padding(.vertical, 9)
                        .foregroundColor(.primary)
                        .frame(maxWidth: .infinity)
                        .overlay(
                            RoundedRectangle(cornerRadius: 3)
                                .stroke(Color(red: 210/255, green: 210/255, blue: 220/255), lineWidth: 0.7)
                        )
                }
                
                Button(action:{
                    print("call")
                }){
                    Text("Call")
                        .font(Font.system(size: 13, weight: .medium))
                        .padding(.vertical, 9)
                        .foregroundColor(.primary)
                        .frame(maxWidth: .infinity)
                        .overlay(
                            RoundedRectangle(cornerRadius: 3)
                                .stroke(Color(red: 210/255, green: 210/255, blue: 210/255), lineWidth: 0.7)
                        )
                }
            }
        }
    }
}

#Preview {
    ProfileActionsView()
}
