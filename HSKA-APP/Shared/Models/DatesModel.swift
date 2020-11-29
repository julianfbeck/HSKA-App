//
//  DatesModel.swift
//  HSKA-Scanner
//
//  Created by Julian Beck on 13.09.20.
//

import Foundation

// MARK: - DatesModel
public struct DatesModel: Codable {
    let semesterID: Int?
    let semesterName: String?
    let entries: [DatesEntry]?

    enum CodingKeys: String, CodingKey {
        case semesterID
        case semesterName, entries
    }
}

// MARK: - DatesEntry
struct DatesEntry: Codable, Identifiable {
    var id = UUID()
    let dateHint, timeHint: String?
    let dates: [DatesDate]?
    let description: String?

    enum CodingKeys: String, CodingKey {
        case dateHint
        case timeHint
        case dates
        case description
    }
}

// MARK: - DatesDate
struct DatesDate: Codable {
    let firstDate, lastDate: String?
    let times: [DatesTime]?
}

// MARK: - DatesTime
struct DatesTime: Codable {
    let startTime, endTime: Int?
}

public enum DatesSemester: String, Codable {
    case current = "current"
    case next = "next"
}
