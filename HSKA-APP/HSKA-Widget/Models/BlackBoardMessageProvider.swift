//
//  SingleBoardMessage.swift
//  Shared
//
//  Created by Julian Beck on 20.07.20.
//

import Foundation
import WidgetKit
import SwiftUI

struct BlackBoardMessageProvider: IntentTimelineProvider {
    typealias Entry = BlackBoardEntry
    typealias Intent = CourseSelectionIntent
    
    func course (for configuration: CourseSelectionIntent) -> CourseOfStudy {
        switch configuration.course {
        case .all:
            return .all
        case .unknown:
            return .all
        case .iNFB:
            return .infb
        case .iNFM:
            return .infm
        case .mINB:
            return .infb
        case .mKIB:
            return .mkib
        }
    }
    func getSnapshot(for configuration: CourseSelectionIntent, in context: Context, completion: @escaping (BlackBoardEntry) -> ()) {
        if context.isPreview {
            let example = BlackBoardEntry(date: Date(), course: CourseOfStudy.all , updates: [testItem])
            completion(example)
        }
        
        let course = self.course(for: configuration)
        HSKAService.getBulletinBoard(client: NetworkClient(),for: course) { updates in
            let entry = BlackBoardEntry(date: Date(), course: course, updates: updates)
            completion(entry)
            
        }
        
    }
    
    func getTimeline(for configuration: CourseSelectionIntent, in context: Context, completion: @escaping (Timeline<BlackBoardEntry>) -> ()) {
        if context.isPreview {
            let example = BlackBoardEntry(date: Date(), course: CourseOfStudy.all , updates: [testItem])
            let expiryDate = Calendar.current.date(byAdding: .minute, value: 2, to: Date()) ?? Date()
            let timelineExample = Timeline(entries: [example], policy: .after(expiryDate))
            completion(timelineExample)

        }
        
        let course = self.course(for: configuration)
        HSKAService.getBulletinBoard(client: NetworkClient(),for: course) { updates in
            let entry = BlackBoardEntry(date: Date(), course: course, updates: updates)
            let expiryDate = Calendar.current.date(byAdding: .minute, value: 2, to: Date()) ?? Date()
            let timeline = Timeline(entries: [entry], policy: .after(expiryDate))
            completion(timeline)
        }
        
        
    }
    
    func placeholder(in context: Context) -> BlackBoardEntry {
        let entry = BlackBoardEntry(date: Date(), course: CourseOfStudy.all , updates: [testItem])
        return entry
    }
    
    
}

struct SingleBoardMessageWidget: Widget {
    public var body: some WidgetConfiguration {
        IntentConfiguration(kind: "Announcements",
                            intent: CourseSelectionIntent.self,
                            provider: BlackBoardMessageProvider()) { entry in
            ZStack {
                if let update = entry.updates.first {
                    BlackBoardMessageWidgetView(update: update)
                } else {
                    BlackBoardMessageWidgetView(update: testItem)
                }
            }
        }
        .configurationDisplayName("Announcements")
        .description("Select your Course")
        .supportedFamilies([.systemSmall, .systemMedium, .systemLarge])
    }
}
