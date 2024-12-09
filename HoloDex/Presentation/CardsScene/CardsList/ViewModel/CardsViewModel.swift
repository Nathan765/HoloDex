//
//  CardsViewModel.swift
//  HoloDex
//
//  Created by Adrien PEREA on 04/12/2024.
//

import Foundation

class CardsViewModel: ObservableObject {
    
    init(getCardsUseCase: GetCardsUseCase) {
        self.getCardsUseCase = getCardsUseCase
    }
    
    @Published var cardDetailsAPIModels: [CardDetailsAPIModel]? = nil

    private let getCardsUseCase: GetCardsUseCase
    
    func fetchCards(pageSize: Int, page: Int, select: [String]) {
        getCardsUseCase.execute(requestValue: GetCardsUseCaseRequestValue(pageSize: pageSize, page: page, select: select)){ result in
            switch result {
            case .success(let cardsApiResponse):
                self.cardDetailsAPIModels = cardsApiResponse.cardDetailsAPIModels
            case .failure(let error):
                print(error)
            }
        }
    }
}
