//
//  HSKAService.swift
//  HSKA-Scanner
//
//  Created by beju on 19.07.20.
//

import Foundation

public struct HSKAService {
    
    public static func getBulletinBoard(client: NetworkClient,for course:CourseOfStudy, completion: ((BlackBoardMessages) -> Void)? = nil) {
        runBlackBoardRequest(.messagesForBulletinBoard(course), on: client, completion: completion)
    }
    
   
    
    private static func runBlackBoardRequest(_ request: URLRequest,
                                         on client: NetworkClient,
                                         completion: ((BlackBoardMessages) -> Void)? = nil) {
        
        client.executeRequest(request: request) { result in
            switch result {
            case .success(let data):
                let decoder = JSONDecoder()
                do {
                    let boardMessages = try decoder.decode(BlackBoardMessages.self, from: data)
                    completion?(boardMessages)
                } catch {
                    print(error.localizedDescription)
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    
    public static func getGrades(client: NetworkClient, accessToken: String, completion: ((GradesModel?) -> Void)? = nil) {
        runGradesRequest(.userGrades(accessToken: accessToken), on: client, completion: completion)
    }
    
    private static func runGradesRequest(_ request: URLRequest,
                                         on client: NetworkClient,
                                         completion: ((GradesModel?) -> Void)? = nil) {
        
        client.executeRequest(request: request) { result in
            switch result {
            case .success(let data):
                let decoder = JSONDecoder()
                do {
                    let boardMessages = try decoder.decode(GradesModel.self, from: data)
                    completion?(boardMessages)
                } catch {
                    print(error.localizedDescription)
                    completion?(nil)
                }
            case .failure(let error):
                completion?(nil)
                print(error.localizedDescription)
            }
        }
    }
    
    public static func getDates(client: NetworkClient, for semester: DatesSemester, completion: ((DatesModel) -> Void)? = nil) {
        runDatesRequest(.semesterDates(for: semester), on: client, completion: completion)
    }
    
    private static func runDatesRequest(_ request: URLRequest,
                                         on client: NetworkClient,
                                         completion: ((DatesModel) -> Void)? = nil) {
        
        client.executeRequest(request: request) { result in
            switch result {
            case .success(let data):
                let decoder = JSONDecoder()
                do {
                    let boardMessages = try decoder.decode(DatesModel.self, from: data)
                    completion?(boardMessages)
                } catch {
                    print(error.localizedDescription)
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
