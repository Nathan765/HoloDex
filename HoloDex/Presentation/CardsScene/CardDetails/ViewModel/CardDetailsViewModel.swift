//
//  CardDetailsViewModel.swift
//  HoloDex
//
//  Created by Adrien PEREA on 24/11/2024.
//
import Foundation

class CardDetailsViewModel: ObservableObject {
    
    init(getCardDetailsUseCase: GetCardDetailsUseCase) {
        self.getCardDetailsUseCase = getCardDetailsUseCase
    }
    
    @Published var cardDetailsAPIModel: CardDetailsAPIModel? = nil
    
    private let getCardDetailsUseCase: GetCardDetailsUseCase
    
    func fetchCardDetails(cardId: String, select: [String]) {
        if cardDetailsAPIModel == nil {
            getCardDetailsUseCase.execute(requestValue: GetCardDetailsUseCaseRequestValue(cardId: cardId, select: select)) { result in
                switch result {
                case .success(let cardDetails):
                    self.cardDetailsAPIModel = cardDetails.cardDetailsAPIModel
                    print(self.cardDetailsAPIModel?.name ?? "No name")
                case .failure(let error):
                    print(error)
                }
            }
        }
    }
}
