//
//  CardsRepository.swift
//  HoloDex
//
//  Created by Adrien PEREA on 08/12/2024.
//

import Foundation

protocol CardsRepository {
    func fetchCardsList(
        pageSize: Int,
        page: Int,
        select: [String],
        completion: @escaping (Result<CardsAPIResponse, Error>) -> Void
    )
}
