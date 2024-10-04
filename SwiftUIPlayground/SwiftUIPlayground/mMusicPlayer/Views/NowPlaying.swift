//
//  NowPlaying.swift
//  SwiftUIPlayground
//
//  Created by Joanna Kühn on 04.10.24.
//

import SwiftUI

struct NowPlaying: View {
    @State var song: Result = Result(artistName: "none", id: "none", name: "none", artworkUrl100: "https://cdn.pixabay.com/photo/2024/01/08/17/59/dandelion-8496044_1280.jpg", url: "https://cdn.pixabay.com/photo/2024/01/08/17/59/dandelion-8496044_1280.jpg")

    var body: some View {
        
            VStack{
                ZStack{
                    HStack{
                        ModifiedButtonView(image: "arrow.left")
                        Spacer()
                        ModifiedButtonView(image: "line.horizontal.3.decrease")
                    }
                    Text("Now playing")
                        .fontWeight(.bold)
                        .foregroundColor(.black.opacity(0.8))
                }
                .padding(.all)
                Spacer()
                let str = song.artworkUrl100
                let url = URL(string: str)
                
                AsyncImage(url: url) { image in
                    image
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .clipShape(Circle())
                        .padding(.all, 8)
                        .background(Color(#colorLiteral(red: 0.8980392157, green: 0.9333333333, blue: 1, alpha: 1)))
                        .clipShape(Circle())
                        .shadow(color: Color.black.opacity(0.35), radius:  8)
                        .shadow(color: Color.white, radius: 10, x: -10, y: -10)
                        .frame(width: 300, height: 300)
                       
                    
                } placeholder: {
                    // ProgressView()
                }
                Link(destination: URL(string: song.url)!) {
                    Image("appleBadge")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 150)
                }
                Spacer()
                Text(song.name)
                    .font(.title)
                    .fontWeight(.bold)
                    .foregroundColor(.black.opacity(0.8))
                    .padding(.top, 25)
                
                Text(song.artistName)
                    .font(.caption)
                    .foregroundColor(.black.opacity(0.8))
                    .padding(.top, 2)
                HStack{
                    Button(action: {}, label: {
                        ModifiedButtonView(image: "play.fill")
                    })
                    
                    Button(action: {}, label: {
                        ModifiedButtonView(image: "forward.fill")
                    })
                }
                .padding(.top, 25)
               
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color(#colorLiteral(red: 0.8980392157, green: 0.9333333333, blue: 1, alpha: 1)))
    }
}

#Preview {
    NowPlaying()
}

