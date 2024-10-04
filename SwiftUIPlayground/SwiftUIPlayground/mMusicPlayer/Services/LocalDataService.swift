//
//  LocalDataService.swift
//  SwiftUIPlayground
//
//  Created by Joanna Kühn on 04.10.24.
//

import Foundation
class LocalDataService{
    static let shared = LocalDataService()
    
    
    func fetchAllSongs() -> [Result] {
        
        // Pfad zu lokaler Datei erstellen
        guard let path = Bundle.main.path(forResource: "charts", ofType: "json") else {
            print("File doesn't exist!")
            return []
        }
        
        do {
            // Daten aus lokaler Datei einlesen
            let data = try Data(contentsOf: URL(filePath: path))
            // Daten von JSON zu unseren Models decodieren
            let songs = try JSONDecoder().decode(CharEntry.self, from: data)
            
            return songs.feed.results
            
        } catch {
            print("Error: \(error)")
            
            return []
        }
        
    }
}
