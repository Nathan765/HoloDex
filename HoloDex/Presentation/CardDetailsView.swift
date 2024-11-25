//
//  CardDetailsView.swift
//  HoloDex
//
//  Created by Adrien PEREA on 24/11/2024.
//

import SwiftUI

struct CardDetailsView: View {
    
    @ObservedObject var viewModel = CardDetailsViewModel()
    
    var body: some View {
        GeometryReader { geometry in
            VStack(alignment: .leading, spacing: 10) {
                let width = geometry.size.width
                
                AsyncImage(url: URL(string: viewModel.cardDetailsAPIModel?.images?.large ?? "")) { phase in
                    switch phase {
                    case .empty:
                        ProgressView()
                            .frame(width: width)
                    case .success(let image):
                        image
                            .resizable()
                            .scaledToFit()
                            .frame(width: width)
                    case .failure:
                        Image(systemName: "exclamationmark.triangle.fill")
                            .resizable()
                            .scaledToFit()
                            .frame(width: width)
                            .foregroundColor(.red)
                    @unknown default:
                        EmptyView()
                    }
                }
                Text("Name: " + (viewModel.cardDetailsAPIModel?.name ?? "Loading..."))
                Text("ID: " + (viewModel.cardDetailsAPIModel?.id ?? "Loading..."))
            }
        }
        .onAppear {
            viewModel.fetchCardDetails(cardId: "xy9-119", select: ["name", "id", "images"])
        }
        .padding()
    }
}

#Preview {
    CardDetailsView()
}
