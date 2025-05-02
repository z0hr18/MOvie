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
    
    func fetch<T: Decodable>(endpoint: Endpoint, completion: @escaping (Result<T, Error>) -> Void) { //T Decodable model olacaq; nəticə gələndə completion-u çağıracağıq
        let request = endpoint.request()
        
        //URLSession ilə sorğu göndəririk
        URLSession.shared.dataTask(with: request) { data, response, error in
            // Burada cavab gələcək
            
            // error gelse
            if let error = error {
                completion(.failure(error))
                return
            }
            
            //data yoxdusa
            guard let data = data else {
                completion(.failure(NSError(domain: "Data Error", code: 0)))
                return
            }
            
            
            //JSON decode
            do {
                let decodedData = try JSONDecoder().decode(T.self, from: data)
                completion(.success(decodedData))
            } catch {
                completion(.failure(error))
            }
            
        }.resume()
    }
}
