//
//  StatusViewModel.swift
//  HSKA-Scanner
//
//  Created by Julian Beck on 20.07.20.
//

import Combine
import Foundation

final class BlackBoardViewModel: ObservableObject {
    @Published var messages: BlackBoardMessages = []
    
    private var client: NetworkClient
    
    init(client: NetworkClient) {
        self.client = client
        HSKAService.getBulletinBoard(client: client, for: .all) { [weak self] status in
            DispatchQueue.main.async {
                self?.messages = status
            }
        }
    }
    
    func update(for course: CourseOfStudy) {
        HSKAService.getBulletinBoard(client: self.client, for: course) { [weak self] status in
            DispatchQueue.main.async {
                self?.messages = status
            }
        }
    }
}
