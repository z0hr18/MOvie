//
//  NetworkService.swift
//  MOvie
//
//  Created by Zohra Guliyeva  on 18.02.25.
//

import Foundation

//API calls
class NetworkService {
    ///api base url and api key
    private let baseURLString = "https://api.themoviedb.org/3/"
    private let apiKey = "f6c6b2fb66c5260836e8dbd13f47b889"
    
    static let shared = NetworkService()
    
    ///Private init() -> Digər yerdən yeni instance yaradılmasın deyə yazılır
    private init() {}
    

}
