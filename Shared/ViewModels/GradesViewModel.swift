//
//  GradesViewModel.swift
//  Shared
//
//  Created by Julian Beck on 13.09.20.
//

import Foundation
import Combine
import Foundation

final class GradesViewModel: ObservableObject {
    @Published var grades: [Grade] =  []
    
    private var client: NetworkClient
    
    init(client: NetworkClient) {
        self.client = client
        
        if LoginService.isLogedIn {
            updateGrades()
        }
    }
    
    public func updateGrades() {
        HSKAService.getGrades(client: client, accessToken: LoginService.getAccessToken() ?? "") { [weak self] grades in
            DispatchQueue.main.async {
                self?.grades = grades?.grades ?? []
            }
        }
    }
}
