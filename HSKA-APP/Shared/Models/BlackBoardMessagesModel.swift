//
//  BlackBoardMessages.swift
//  HSKA-Scanner
//
//  Created by beju on 19.07.20.
//

import Foundation

// MARK: - BlackBoardMessage
public struct BlackBoardMessage: Codable, Identifiable {
    let title, subTitle: String
    let courseOfStudies: [CourseOfStudy]
    let publicationDate, expirationDate: String
    let content: String
    let links: JSONNull?
    let type: TypeEnum
    let deleteOnExpiration: Bool
    let publicationTimestamp: String
    public let id, idOwner: Int
    let emailOwner, nameOwner: String
}

public enum CourseOfStudy: String, Codable {
    case infb = "INFB"
    case infm = "INFM"
    case minb = "MINB"
    case mkib = "MKIB"
    case all = ""
}

enum TypeEnum: String, Codable {
    case announcement = "announcement"
    case cancellation = "cancellation"
}

public typealias BlackBoardMessages = [BlackBoardMessage]

// MARK: - Encode/decode helpers

class JSONNull: Codable, Hashable {

    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
        return true
    }

    public var hashValue: Int {
        return 0
    }

    public init() {}

    public required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
    }
}
