//
//  GetCardDetailsUseCase.swift
//  HoloDex
//
//  Created by Adrien PEREA on 09/12/2024.
//

import Foundation

protocol GetCardDetailsUseCase {
    func execute(
        requestValue: GetCardDetailsUseCaseRequestValue,
        completion: @escaping (Result<CardDetailsAPIResponse, Error>) -> Void
    )
}

struct GetCardDetailsUseCaseRequestValue: Equatable {
    let cardId: String
    let select: [String]
}

final class DefaultGetCardDetailsUseCase: GetCardDetailsUseCase {
    private let cardDetailsRepository: CardDetailsRepository

    init(cardDetailsRepository: CardDetailsRepository) {
        self.cardDetailsRepository = cardDetailsRepository
    }

    func execute(requestValue: GetCardDetailsUseCaseRequestValue, completion: @escaping (Result<CardDetailsAPIResponse, any Error>) -> Void) {
        return cardDetailsRepository.fetchCardDetails(cardId: requestValue.cardId,
                                                        select: requestValue.select) { result in
                                                        completion(result)
                                                    }
    }
}
