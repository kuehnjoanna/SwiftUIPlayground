//
//  ChartView.swift
//  SwiftUIPlayground
//
//  Created by Joanna Kühn on 04.10.24.
//

import SwiftUI

struct ChartView: View {
    
    //    var songs: [SomeSong] = [SomeSong(picture: "trees", title: "Sky", artistsName: "googoo dolls"), SomeSong(picture: "trees", title: "Sky", artistsName: "googoo dolls"), SomeSong(picture: "trees", title: "Sky", artistsName: "googoo dolls"), SomeSong(picture: "trees", title: "Sky", artistsName: "googoo dolls")]
    @State private var sallsongs: [Result] = []
    @State var allsongs: [Result] = []
    
    var body: some View {
        NavigationStack{
        VStack{
            Text("10 Best Songs")
                .fontWeight(.bold)
                .foregroundColor(.black.opacity(0.8))

            
            List{
                
                ForEach(sallsongs, id:\.id){ song in
                
                    ZStack(){
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
                                .frame(width: 200, height: 300)
                            
                        } placeholder: {
                            // ProgressView()
                        }
                        NavigationLink(destination: NowPlaying(song: song)){
                            VStack{
                                
                                Text(song.name).foregroundStyle(Color.black).font(.title2)
                                Text(song.artistName).foregroundStyle(Color.black).font(.title)
                            }
                            .frame(maxWidth: .infinity, maxHeight: 70)
                            .padding(10)
                            .background(  Rectangle()
                                .fill(Color(#colorLiteral(red: 0.8980392157, green: 0.9333333333, blue: 1, alpha: 1)).opacity(0.5))
                                .cornerRadius(16)
                                .shadow(radius: 2) )
                        }
                        
                    }
                    .frame(width: 338, height: 200, alignment: .center)
                    .padding(5)
                    
                    
                }.listRowBackground(Color(#colorLiteral(red: 0.8980392157, green: 0.9333333333, blue: 1, alpha: 1)))
                //oben foreachende
            }
            .scrollContentBackground(.hidden)
            
        }
        .background(Color(#colorLiteral(red: 0.8980392157, green: 0.9333333333, blue: 1, alpha: 1)))
        .task {
            do{
                sallsongs = try await getStuff()
            }catch someError.invalidData {
                print("invaliddata")
            }catch someError.invalidResponse{
                print("invalidresponse")
            }catch someError.invalidUrl{
                print("invalidurl")
            }catch{
                print("unexpected error")
            }
        }
        }
//        .onAppear {
//            fetchData()
//        }
        
    }
    
    private func fetchData() {
        allsongs = LocalDataService.shared.fetchAllSongs()
    }


    func getStuff() async throws -> [Result]{
        let endpoint = "https://rss.applemarketingtools.com/api/v2/de/music/most-played/10/songs.json"

        guard let url = URL(string: endpoint)else {
            throw someError.invalidUrl
        }
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw someError.invalidResponse
        }
        
        do {
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            let songs = try decoder.decode(CharEntry.self, from: data)
            return songs.feed.results
        }catch{
            throw someError.invalidData
        }
    }
    
    
}
enum someError: Error{
    case invalidUrl, invalidResponse, invalidData
}

#Preview {
    ChartView()
}
