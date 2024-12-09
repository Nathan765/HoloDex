//
//  CardView.swift
//  HoloDex
//
//  Created by Adrien PEREA on 04/12/2024.
//

import SwiftUI

struct CardsView: View {
    
    @ObservedObject var viewModel: CardsViewModel
    
    var body: some View {
        NavigationView {
            ScrollView {
                let columns = [
                    GridItem(.adaptive(minimum: UIScreen.main.bounds.width / 2 - 40))
                ]
                
                LazyVGrid(columns: columns, spacing: 16) {
                    ForEach(viewModel.cardDetailsAPIModels ?? [], id: \.id) { card in
                        NavigationLink(destination: CardDetailsView(card: card)) {
                            AsyncImage(url: URL(string: card.images?.large ?? "")) { phase in
                                switch phase {
                                case .empty:
                                    ProgressView()
                                        .frame(width: UIScreen.main.bounds.width / 2 - 16)
                                case .success(let image):
                                    image
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: UIScreen.main.bounds.width / 2 - 16)
                                        .onTapGesture {

                                        }
                                case .failure:
                                    Image(systemName: "exclamationmark.triangle.fill")
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: UIScreen.main.bounds.width / 2 - 16)
                                        .foregroundColor(.red)
                                @unknown default:
                                    EmptyView()
                                }
                            }
                        }
                    }
                }
                .padding(.horizontal)
            }

        }
        .onAppear {
            viewModel.fetchCards(pageSize: 20, page: 1, select: ["name", "id", "images"])
        }
    }
}

#Preview {
//    CardsView(viewModel: CardsViewModel(getCardsUseCase: DefaultGetCardsUseCase(cardsRepository: CardsRepository())))
}
