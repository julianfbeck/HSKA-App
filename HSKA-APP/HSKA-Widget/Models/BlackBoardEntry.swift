//
//  MultiBoardMessage.swift
//  Shared
//
//  Created by Julian Beck on 20.07.20.
//
import WidgetKit

struct BlackBoardEntry: TimelineEntry {
    let date: Date
    let course: CourseOfStudy?
    let updates: BlackBoardMessages
}
