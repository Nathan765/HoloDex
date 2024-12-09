//
//  Card.swift
//  HoloDex
//
//  Created by Adrien PEREA on 08/12/2024.
//


struct Card: Equatable, Identifiable {
    static func == (lhs: Card, rhs: Card) -> Bool {
        lhs.id == rhs.id
    }
       
    let id: String?
    let name: String?
    let images: Images?
}

struct Images: Decodable {
    let small, large: String?
}
