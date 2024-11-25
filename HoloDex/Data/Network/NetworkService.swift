//
//  NetworkService.swift
//  HoloDex
//
//  Created by Adrien PEREA on 21/11/2024.
//

import Moya

protocol NetworkService {
    func request<T:Decodable>(target: TargetType, completion: @escaping (Result<T, Error>) -> Void)
}
