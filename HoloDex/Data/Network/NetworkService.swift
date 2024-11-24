//
//  NetworkService.swift
//  HoloDex
//
//  Created by Adrien PEREA on 21/11/2024.
//

protocol NetworkService {
    func fetchCardDetails(cardId: String, select: [String], completion: @escaping (Result<CardDetailsAPIResponse, Error>) -> Void)
}
