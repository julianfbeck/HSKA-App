//
//  URLRequest+HSKA.swift
//  Shared
//
//  Created by Julian Beck on 20.07.20.
//

import Foundation
extension URLRequest {
    private static var baseURL: String { "https://www.iwi.hs-karlsruhe.de/iwii" }

    public static var bulletinBoardStatus: URLRequest {
        .init(endpoint: "REST", "newsbulletinboard")
    }
    
    public static func messagesForBulletinBoard(_ course: CourseOfStudy) -> URLRequest {
        .init(endpoint: "REST", "newsbulletinboard", course.rawValue)
    }
    
    public static func userGrades(accessToken: String) -> URLRequest {
        .init(endpoint: "REST", "grades", "all", accessToken: accessToken)
    }
    
    public static func semesterDates(for semester: DatesSemester) -> URLRequest {
        .init(endpoint: "REST", "officialcalendar", "v2", semester.rawValue)
    }
    

    init(endpoint: String..., accessToken: String? = nil) {
        
        guard let url = URL(string: Self.baseURL + "/" + endpoint.joined(separator: "/")) else {
            preconditionFailure("Expected a valid URL")
        }
        self.init(url: url)
        if let accessToken = accessToken {
            self.setValue("Basic " + accessToken, forHTTPHeaderField: "Authorization")
        }
    }
}
