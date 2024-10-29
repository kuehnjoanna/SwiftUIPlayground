//
//  MatchedGeometryView.swift
//  SwiftUIPlayground
//
//  Created by Joanna Kühn on 28.10.24.
//

import SwiftUI

struct MatchedGeometryView: View {
    @State private var isClicked: Bool = false
    @Namespace private var namespace

    var body: some View {
     
        VStack{
            if !isClicked {
                RoundedRectangle(cornerRadius: 25)
                .matchedGeometryEffect(id: "rectangle", in: namespace)
                    .frame(width: 100, height: 100)                
                //                .offset(y: isClicked ? UIScreen.main.bounds.height * 0.7 : 0)
                //
            }
            Spacer()
      
     
        }
        .frame(width: 400, height: 300)
        .background(Color.red)
        .onTapGesture {
            withAnimation(.easeInOut){
                isClicked.toggle()
            }
        }
        
        VStack{
            Spacer()
            if isClicked{
                RoundedRectangle(cornerRadius: 25)
                    .matchedGeometryEffect(id: "rectangle", in: namespace)
                    .frame(width: 200, height: 100)
                        }
        }
        .frame(width: 400, height: 300)
    }
}

#Preview {
    MatchedGeometryView()
}
