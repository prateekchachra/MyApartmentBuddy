//
//  Person.swift
//  MyApartmentBuddy
//
//  Created by Prateek Chachra on 29/10/23.
//

import Foundation



struct Person: Hashable, Identifiable {
    let id = UUID().uuidString
    var name: String
    var imageURLs: [URL]
    var bio: String
    var age: Int
}

extension Person {
    static let example = Person(
        name: "Alex",
        imageURLs: [URL(string: "https://image-cdn.essentiallysports.com/wp-content/uploads/Screenshot-2023-01-25-210813-638x710.png")!],
        bio : "Professional tennis player",
        age: 21
    )
    static let example2 = Person(
        name: "Jessica",
        imageURLs: [URL(string: "https://images.news18.com/ibnlive/uploads/2022/05/jessica-pegula.jpg")!],
        bio: "Professional badminton player who loves dogs",
        age: 25
    )
    
    static let examples: [Person] = [
        Person.example,
        Person.example2,
        Person(name: "Olivia", imageURLs: [URL(string: "https://media.self.com/photos/57d8a22a4b76f0f832a0e3b9/4:3/w_2560%2Cc_limit/Maria-USOpen2015-3.jpg")!], bio: "Rookie Tennis player", age: 33),
        Person(name: "Karman", imageURLs: [URL(string: "https://thebridge.in/h-upload/2021/11/26/19360-karman-kaur-thandi.webp")!], bio: "Spanish Badminton player", age: 29),
        Person(name: "Mia", imageURLs: [URL(string: "https://www.tennisnet.com/fileadmin/_processed_/e/b/csm_rankings-sakkari_a24a183d8c.jpg")!], bio: "British professional cricketer", age: 27),
    ]
}
