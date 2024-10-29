//
//  BookDataManager.swift
//  SwiftUIPlayground
//
//  Created by Joanna Kühn on 27.10.24.
//

import Foundation
class BookDataManager {
    static let shared = BookDataManager()
    
    let categories: [BookCategory] = [
        BookCategory(name: "Fiction", books: [
            BookModel(title: "The Endless Shore", imageName: "theEndlessShore", rating: 4.2, description: "A tale of love and mystery by the sea.", story: "After moving to a seaside town, Clara uncovers secrets buried in the sands."),
            BookModel(title: "Midnight Confections", imageName: "midnightconfections", rating: 4.7, description: "A romance brewed in a bakery.", story: "As Alex navigates the high-stakes world of pastries, a new assistant stirs things up."),
            BookModel(title: "The Last Whisper", imageName: "thelastwhisper", rating: 4.5, description: "A poignant story of life’s fleeting moments.", story: "A chance encounter on a train leaves an indelible mark on a young woman.")
        ]),
        
        BookCategory(name: "Mystery", books: [
            BookModel(title: "The Forest Murmurs", imageName: "forestmurmurs", rating: 4.6, description: "A small-town mystery unravels in the woods.", story: "Detective Sam Bell is drawn into a twisted case where every tree hides a clue."),
            BookModel(title: "Whispers of Deception", imageName: "whispersofdeception", rating: 4.4, description: "A thriller that keeps you guessing.", story: "As cryptic letters arrive, Miranda must question everyone around her."),
            BookModel(title: "The Lake House", imageName: "thelakehouse", rating: 4.8, description: "A vacation retreat goes awry.", story: "Three friends reunite, only to uncover a dark secret hidden in their past.")
        ]),
        
        BookCategory(name: "Romance", books: [
            BookModel(title: "Puppy Love", imageName: "puppylove", rating: 4.3, description: "A lighthearted romance that began with a dog.", story: "Emma's life changes when a lost puppy leads her to a handsome veterinarian."),
            BookModel(title: "Letters Unsent", imageName: "lettersunsent", rating: 4.9, description: "A love story told through letters left behind.", story: "Years after a tragic accident, a box of letters reveals a hidden romance."),
            BookModel(title: "Beneath the Blossoms", imageName: "blossoms", rating: 4.7, description: "Love blossoms under the cherry trees.", story: "An artist and a writer find inspiration in each other during spring.")
        ]),
        
        BookCategory(name: "Action", books: [
            BookModel(title: "Rescue Mission", imageName: "rescuemission", rating: 4.5, description: "A pulse-pounding action story.", story: "Agent Jack Ryan must rescue hostages in a foreign land."),
            BookModel(title: "The Lost City", imageName: "thelostcity", rating: 4.6, description: "A high-stakes adventure to a fabled city.", story: "Archaeologist Sarah Carter is on a race against time to find a lost civilization."),
            BookModel(title: "Undercover", imageName: "undercover", rating: 4.3, description: "The line between ally and enemy blurs.", story: "John's loyalty is tested as he goes undercover in a criminal organization.")
        ])
    ]
    
    var mostReadBooks: [BookModel] = [
        BookModel(title: "Echoes of the Ocean", imageName: "echoesocean", rating: 4.8, description: "A heartwarming tale of finding oneself.", story: "After a personal tragedy, Anna retreats to the ocean to find healing."),
        BookModel(title: "The Forgotten Path", imageName: "theforgottenpath", rating: 4.9, description: "An inspiring journey of rediscovery.", story: "Lost in the forest, young Ellie stumbles upon a forgotten path leading to hidden treasures."),
        BookModel(title: "Under the Sun", imageName: "underthesun", rating: 4.7, description: "A summer adventure like no other.", story: "Three friends set out on a road trip, discovering more than they ever expected.")
    ]
}
