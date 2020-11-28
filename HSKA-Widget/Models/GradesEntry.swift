//
//  GradesEntry.swift
//  HSKA-WidgetExtension
//
//  Created by Julian Beck on 14.09.20.
//

import Foundation
import WidgetKit

struct GradesEntry: TimelineEntry {
    let date: Date
    let grades: GradesModel?
    let isLoggedIn: Bool
}
