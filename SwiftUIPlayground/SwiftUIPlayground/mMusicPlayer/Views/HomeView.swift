//
//  HomeView.swift
//  SwiftUIPlayground
//
//  Created by Joanna Kühn on 04.10.24.
//

import SwiftUI

struct HomeView: View {

    var body: some View {
        VStack{
            NavigationStack{
                TabView{
                    ChartView().tabItem { Label("Top Charts", systemImage: "music.note") }
                    
                    
                    SearchView().tabItem { Label("Search", systemImage: "magnifyingglass") }
                }
            }
    }
    }
}

#Preview {
    HomeView()
}
