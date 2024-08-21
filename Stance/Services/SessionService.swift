//
//  SessionService.swift
//  Stance
//
//  Created by Sravan Kumar Pabolu on 21/08/24.
//

import Foundation
import Combine

protocol SessionService {
    func getSessionData() -> AnyPublisher<Session, NetworkError>
}

class SessionNetworkService: SessionService {
    func getSessionData() -> AnyPublisher<Session, NetworkError> {
        let urlString = "https://run.mocky.io/v3/541fe76b-7ff1-48cf-90a3-bb145a300d6d"
        return NetworkManager.shared.fetchData(from: urlString, type: Session.self)
    }
}
