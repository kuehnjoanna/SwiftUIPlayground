//
//  ModifiedButtonView.swift
//  SwiftUIPlayground
//
//  Created by Joanna Kühn on 04.10.24.
//

import SwiftUI


struct ModifiedButtonView: View {
    var image: String
    var body: some View {
        Button(action: {}, label: {
            Image(systemName: image)
                .font(.system(size: 14, weight: .bold))
                .padding(.all, 25)
                .foregroundColor(.black.opacity(0.8))
                .background(
                    ZStack{
                        Color(#colorLiteral(red: 0.7608050108, green: 0.8164883852, blue: 0.9259157777, alpha: 1))
                        
                        Circle()
                            .foregroundColor(.white)
                            .blur(radius: 4)
                            .offset(x: -8, y: -8)
                        
                        Circle()
                            .fill(LinearGradient(gradient: Gradient(colors: [Color.red, Color.yellow]), startPoint: .topLeading, endPoint: .bottomTrailing))
                            .padding(2)
                            .blur(radius: 2)
                    }
                        .clipShape(Circle())
                        .shadow(color: Color(#colorLiteral(red: 0.7608050108, green: 0.8164883852, blue: 0.9259157777, alpha: 1)), radius: 20, x: 20, y: 20)
                        .shadow(color: .white, radius: 20, x:-20, y: -20)
                    
                )
        })
    }
}

#Preview {
    ModifiedButtonView(image: "forward")
}
