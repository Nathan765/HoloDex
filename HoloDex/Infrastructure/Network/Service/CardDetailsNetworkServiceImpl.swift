//
//  CardDetailsNetworkServiceImpl.swift
//  HoloDex
//
//  Created by Adrien PEREA on 22/11/2024.
//

import Foundation
import Moya

class CardDetailsNetworkServiceImpl: NetworkService {
    
    let provider = MoyaNetworkServiceImpl<PokemonTcgApi>()
    
    func request<T: Decodable>(target: TargetType, completion: @escaping (Result<T, Error>) -> Void) {
        provider.request(target: target as! PokemonTcgApi) { result in
            switch result {
            case .success(let response):
                do {
                    guard (200...299).contains(response.statusCode) else {
                        throw NSError(domain: "", code: response.statusCode, userInfo: [NSLocalizedDescriptionKey: "Erreur HTTP \(response.statusCode)"])
                    }
                    
                    let decodedData = try JSONDecoder().decode(T.self, from: response.data)
                    completion(.success(decodedData))
                } catch {
                    completion(.failure(error))
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
}
