//
//  NetworkManager.swift
//  MOvie
//
//  Created by Zohra Guliyeva  on 26.03.25.
//

import Foundation

final class NetworkManager {
    static let shared  = NetworkManager()
    private init() {} // kənardan yeni instance yaradılmasın deyə
    
    func fetch<T: Decodable>(endpoint: Endpoint, completion: @escaping (Result<T, Error>) -> Void) {
        
    }
}
