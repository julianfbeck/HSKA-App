//
//  DatesViewModel.swift
//  HSKA-Scanner
//
//  Created by Julian Beck on 13.09.20.
//

import Combine
import Foundation

final class DatesViewModel: ObservableObject {
    @Published var dateInfo: DatesModel? = nil
    
    private var client: NetworkClient
    
    init(client: NetworkClient) {
        self.client = client
        HSKAService.getDates(client: client, for: .current) { [weak self] dateInfo in
            DispatchQueue.main.async {
                self?.dateInfo = dateInfo
            }
        }
    }
    
    func update(for semester: DatesSemester) {
        HSKAService.getDates(client: client, for: semester) { [weak self] dateInfo in
            DispatchQueue.main.async {
                self?.dateInfo = dateInfo
            }
        }
    }
}
