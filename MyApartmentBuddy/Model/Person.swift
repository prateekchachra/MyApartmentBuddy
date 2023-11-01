//
//  Person.swift
//  MyApartmentBuddy
//
//  Created by Prateek Chachra on 29/10/23.
//

import Foundation



struct Person: Hashable{
    var name: String
    var imageURLs: [URL]
    var bio: String
}

extension Person {
    static let example = Person(
        name: "Alex",
        imageURLs: [URL(string: "https://image-cdn.essentiallysports.com/wp-content/uploads/Screenshot-2023-01-25-210813-638x710.png")!],
        bio : "Professional tennis player"
    )
    static let example2 = Person(name: "Jessica", imageURLs: [URL(string: "https://images.news18.com/ibnlive/uploads/2022/05/jessica-pegula.jpg")!],
    bio: "Professional badminton player who loves dogs")
}
