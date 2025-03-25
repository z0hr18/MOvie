//
//  Endpoint.swift
//  MOvie
//
//  Created by Zohra Guliyeva  on 23.03.25.
//

import Foundation

protocol EndPointProtocol { //qaydalari demeyi ucun protokol yaradiriq neler var  endpointdə URL, path, method və header var. Bu protokol bizim enum Endpoint-ə "qaydaları" izah edir.
    var baseURL: String { get }
    var path: String { get }
    var method: HTTPMethod { get }
    var header: [String: String]? { get }
    
    func request() -> URLRequest //url ferqli endpointler aldigi ucun burada handle ede bilerik
}

enum Endpoint {
    case popular
    case topRated
    case upcoming
    case nowPlaying
    case movieDetail(id: Int)
    case search(query: String)
    case genreList
}

enum HTTPMethod: String {
    case get = "GET"
    case post = "POST"
}

extension Endpoint: EndPointProtocol {
    var baseURL: String { "https://api.themoviedb.org/3" }
    
    var path: String {
        switch self {
        case .popular:
            return "/movie/popular"
        case .topRated:
            return "/movie/top_rated"
        case .upcoming:
            return "/movie/upcoming"
        case .nowPlaying:
            return "/movie/now_playing"
        case .movieDetail(let id):
            return "/movie/\(id)"
        case .search:
            return "/search/movie"
        case .genreList:
            return "/genre/movie/list"
        }
    }
    
    var method: HTTPMethod {
        switch self {
        case    .popular,
                .topRated,
                .upcoming,
                .nowPlaying,
                .movieDetail,
                .search,
                .genreList:
            return .get
        }
    }
    
    var header: [String : String]? {
//        var header : [String : String] = ["Authozation": "Bareer \(token)"]  //header gondereceyikse bu cur yaza bilerik
//        return header
        return nil
    }
    
    func request() -> URLRequest {
        guard var components = URLComponents(string: baseURL) else {
            fatalError("URL ERROR")
        }
        components.path = path
        
        var request = URLRequest(url: components.url!)
        request.httpMethod = method.rawValue
        
        if let header = header {
            for (key, value) in header {
                request.setValue(value, forHTTPHeaderField: key)
            }
        }
        return request
    }
}
