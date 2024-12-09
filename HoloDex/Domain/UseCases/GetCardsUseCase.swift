//
//  GetCardsUseCase.swift
//  HoloDex
//
//  Created by Adrien PEREA on 08/12/2024.
//

import Foundation

protocol GetCardsUseCase {
    func execute(
        requestValue: GetCardsUseCaseRequestValue,
        completion: @escaping (Result<CardsAPIResponse, Error>) -> Void
    )
}

struct GetCardsUseCaseRequestValue: Equatable {
    let pageSize: Int
    let page: Int
    let select: [String]
}

final class DefaultGetCardsUseCase: GetCardsUseCase {
    private let cardsRepository: CardsRepository

    init(cardsRepository: CardsRepository) {
        self.cardsRepository = cardsRepository
    }

    func execute(requestValue: GetCardsUseCaseRequestValue, completion: @escaping (Result<CardsAPIResponse, any Error>) -> Void) {
        return cardsRepository.fetchCardsList(pageSize: requestValue.pageSize,
                                                page: requestValue.page,
                                                select: requestValue.select,
                                                completion: { result in
                                                    completion(result)
                                                })
    }
}
