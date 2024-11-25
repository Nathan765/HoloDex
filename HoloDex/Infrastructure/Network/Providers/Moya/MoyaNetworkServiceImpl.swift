//
//  MoyaNetworkServiceImpl.swift
//  HoloDex
//
//  Created by Adrien PEREA on 21/11/2024.
//
import Moya

class MoyaNetworkServiceImpl<T: TargetType> {
    
    private let provider: MoyaProvider<T>
    
    init() {
        self.provider = MoyaProvider<T>()
    }

    func request(target: T, completion: @escaping (Result<Response, MoyaError>) -> Void) {
        provider.request(target) { result in
            completion(result)
            switch result {
            case .success:
                let response = try! result.get()
                print("response: \(response)")
            case .failure:
                print("error")
            }
        }
    }

}
