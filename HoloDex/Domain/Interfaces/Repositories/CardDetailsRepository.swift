//
//  CardDetailsRepository.swift
//  HoloDex
//
//  Created by Adrien PEREA on 09/12/2024.
//

import Foundation

protocol CardDetailsRepository {
    func fetchCardDetails(
        cardId: String,
        select: [String],
        completion: @escaping (Result<CardDetailsAPIResponse, Error>) -> Void
    )
}
