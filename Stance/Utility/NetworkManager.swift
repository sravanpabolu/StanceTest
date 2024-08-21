//
//  NetworkManager.swift
//  Stance
//
//  Created by Sravan Kumar Pabolu on 21/08/24.
//

import Foundation
import Combine

enum NetworkError: Error {
    case invalidURL
    case requestFailed(statusCode: Int)
    case customError(error: String)
    
    var description: String {
        switch self {
        case .invalidURL:
            return "Invalid URL"
        case .requestFailed:
            return "Invalid response data"
        case .customError(let error):
            return error.description
        }
    }
}

class NetworkManager {
    static let shared = NetworkManager()
    
    //Do not let user to initialize the NetworkManager separately. It should be singleton only
    private init() { }
    
    func fetchData<T: Decodable>(from urlString: String, type: T.Type) -> AnyPublisher<T, NetworkError> {
        
        // verify url
        guard let url = URL(string: urlString) else {
            Logger.error("URL Error")
            return Fail(error: NetworkError.invalidURL).eraseToAnyPublisher()
        }
        
        Logger.debug("Request URL - \(url)")
        
        return URLSession.shared.dataTaskPublisher(for: url)
            .tryMap { data, response in
                guard let httpResponse = response as? HTTPURLResponse, 200..<300 ~= httpResponse.statusCode else {
                    throw NetworkError.requestFailed(statusCode: (response as? HTTPURLResponse)?.statusCode ?? 0)
                }
                Logger.debug("Request response ----- ")
                Logger.debug("\(try JSONSerialization.jsonObject(with: data))")
                Logger.debug("Status response - \(httpResponse.statusCode)")
                return data
            }
            .decode(type: T.self, decoder: JSONDecoder())
            .mapError { error in
                Logger.error("Decoding error")
                return NetworkError.customError(error: error.localizedDescription)
            }
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}
