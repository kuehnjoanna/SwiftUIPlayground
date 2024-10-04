//
//  SearchView.swift
//  SwiftUIPlayground
//
//  Created by Joanna Kühn on 04.10.24.
//

import SwiftUI

struct SearchView: View {
    @State var results: [Results] = [Results(artistId: 7839624, artistName: "some", trackName: "lalala", artistViewUrl: "none", trackViewUrl: "none", artworkUrl100: "https://cdn.pixabay.com/photo/2024/01/08/17/59/dandelion-8496044_1280.jpg"), Results(artistId: 12323, artistName: "some", trackName: "lalaljgfgha", artistViewUrl: "none", trackViewUrl: "none", artworkUrl100: "https://cdn.pixabay.com/photo/2024/01/08/17/59/dandelion-8496044_1artistId: 3123, 280.jpg"), Results(artistId: 7657, artistName: "some", trackName: "laljghvhjgala", artistViewUrl: "none", trackViewUrl: "none", artworkUrl100: "https://cdn.pixabay.com/photo/2024/01/08/17/59/dandelion-8496044_1280.jpg")]
    @State var searchTerm = ""
    var filteredResult: [Results]{
        guard !searchTerm.isEmpty else {return results}
        return results.filter{
            $0.trackName.localizedCaseInsensitiveContains(searchTerm)
        }
    }
    
    var body: some View {
        NavigationStack{
            VStack{
                Text("10 Best Songs")
                    .fontWeight(.bold)
                    .foregroundColor(.black.opacity(0.8))
                
                
                List{
                    
                    ForEach($results, id:\.artistId){ song in
                        
                        ZStack(){
                            let str = song.artworkUrl100
                            //  let url = URL(string: str)
                            
                            //                            AsyncImage(url: url) { image in
                            //      image
                            Image("trees")
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .clipShape(Circle())
                                .padding(.all, 8)
                                .background(Color(#colorLiteral(red: 0.8980392157, green: 0.9333333333, blue: 1, alpha: 1)))
                                .clipShape(Circle())
                                .shadow(color: Color.black.opacity(0.35), radius:  8)
                                .shadow(color: Color.white, radius: 10, x: -10, y: -10)
                                .frame(width: 200, height: 300)
                            
                            //                            } placeholder: {
                            //                                // ProgressView()
                            //                            }
                            //                            NavigationLink(destination: NowPlaying(song: song)){
                            //                                VStack{
                            //
                            //                                    Text(song.name).foregroundStyle(Color.black).font(.title2)
                            //                                    Text(song.artistName).foregroundStyle(Color.black).font(.title)
                            //                                }
                            //                                .frame(maxWidth: .infinity, maxHeight: 70)
                            //                                .padding(10)
                            //                                .background(  Rectangle()
                            //                                    .fill(Color(#colorLiteral(red: 0.8980392157, green: 0.9333333333, blue: 1, alpha: 1)).opacity(0.5))
                            //                                    .cornerRadius(16)
                            //                                    .shadow(radius: 2) )
                            //                            }
                            
                        }
                        .frame(width: 338, height: 200, alignment: .center)
                        .padding(5)
                        
                        
                    }.listRowBackground(Color(#colorLiteral(red: 0.8980392157, green: 0.9333333333, blue: 1, alpha: 1)))
                    //oben foreachende
                }
                .scrollContentBackground(.hidden)
                
                
            }
            .background(Color(#colorLiteral(red: 0.8980392157, green: 0.9333333333, blue: 1, alpha: 1)))
            
        }.navigationTitle("search")
            .searchable(text: $searchTerm)
            .onChange(of: searchTerm) { newValue in
                Task {
                    do {
                        results = try await getStuff()
                    } catch {
                        print("Search failed: \(error)")
                    }
                }
            }
    }
    
    //https://itunes.apple.com/search?parameterkeyvalue
    //https://itunes.apple.com/search?term=jack+johnson&entity=song
    func getStuff() async throws -> [Results] {
    
        let endpoint = "https://itunes.apple.com/search?term=\(searchTerm.localizedLowercase)&entity=song"
        print(endpoint)
        guard let url = URL(string: endpoint) else {
            throw someError.invalidUrl
        }
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw someError.invalidResponse
        }
        
        do {
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase
            let songs = try decoder.decode(SearchEntry.self, from: data)
            return songs.results
        } catch {
            throw someError.invalidData
        }
    }
}

#Preview {
    SearchView()
}
