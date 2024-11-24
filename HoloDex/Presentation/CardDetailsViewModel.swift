//
//  CardDetailsViewModel.swift
//  HoloDex
//
//  Created by Adrien PEREA on 24/11/2024.
//
import Foundation

class CardDetailsViewModel: ObservableObject {
    
    @Published var cardDetailsAPIModel: CardDetailsAPIModel? = nil
    let networkService: NetworkService = CardDetailsNetworkServiceImpl()
    
    func fetchCardDetails(cardId: String, select: [String]) {
        networkService.fetchCardDetails(cardId: cardId, select: select) { result in
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
