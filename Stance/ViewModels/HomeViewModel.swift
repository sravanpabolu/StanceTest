//
//  HomeViewModel.swift
//  Stance
//
//  Created by Sravan Kumar Pabolu on 21/08/24.
//

import Foundation
import Combine

class HomeViewModel: ObservableObject {
    @Published var error: NetworkError?
    @Published var sessionData: Session?
    @Published var isLoading = false
    private var cancellables = [AnyCancellable]()
    private var service: SessionService
    
    init(service: SessionService = SessionNetworkService()) {
        self.service = service
    }
    
    func getSessionData() {
        isLoading = true
        error = nil
        
        service.getSessionData()
            .receive(on: DispatchQueue.main)
            .sink { completion in
                self.isLoading = false
                switch completion {
                case .failure(let error):
                    self.error = error
                case .finished:
                    break
                }
            } receiveValue: { [weak self] sessionData in
                self?.sessionData = sessionData
            }
            .store(in: &cancellables)
    }
}
