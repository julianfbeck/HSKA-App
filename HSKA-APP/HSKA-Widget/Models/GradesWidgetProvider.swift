//
//  GradesWidgetProvider.swift
//  HSKA-WidgetExtension
//
//  Created by Julian Beck on 14.09.20.
//

import Foundation
import WidgetKit
import SwiftUI
struct GradesWidgetProvider: TimelineProvider {
    
    typealias Entry = GradesEntry

    func getSnapshot(in context: Context, completion: @escaping (GradesEntry) -> ()) {
        if context.isPreview {
            let example = GradesEntry(date: Date(), grades: gradeTestItem, isLoggedIn: true)
            completion(example)
        }
        HSKAService.getGrades(client: NetworkClient(), accessToken: LoginService.getAccessToken() ?? "") { grades in
            let entry = GradesEntry(date: Date(), grades: grades, isLoggedIn: LoginService.isLogedIn)
            completion(entry)
            
        }
        
    }
    
    func getTimeline(in context: Context, completion: @escaping (Timeline<GradesEntry>) -> ()) {
        if context.isPreview {
            let example = GradesEntry(date: Date(), grades: gradeTestItem, isLoggedIn: true)
            let expiryDate = Calendar.current.date(byAdding: .minute, value: 2, to: Date()) ?? Date()
            let timelineExample = Timeline(entries: [example], policy: .after(expiryDate))
            completion(timelineExample)
        }
        
        HSKAService.getGrades(client: NetworkClient(), accessToken: LoginService.getAccessToken() ?? "") { grades in
            let entry = GradesEntry(date: Date(), grades: grades, isLoggedIn: LoginService.isLogedIn)
            let expiryDate = Calendar.current.date(byAdding: .minute, value: 2, to: Date()) ?? Date()
            let timeline = Timeline(entries: [entry], policy: .after(expiryDate))
            completion(timeline)
        }
        
        
    }
    
    func placeholder(in context: Context) -> GradesEntry {
        let entry = GradesEntry(date: Date(), grades: gradeTestItem, isLoggedIn: true)
        return entry
    }
    
    
}

struct GradesWidget: Widget {
    public var body: some WidgetConfiguration {
        StaticConfiguration(kind: "Show Grades for the Current User",
                            provider: GradesWidgetProvider()) { entry in
            GradesWidgetView(entry: entry)
        }
        .configurationDisplayName("HSKA IWI Grades")
        .description("Display your latest Grade")
        .supportedFamilies([.systemSmall, .systemMedium])
    }
}

extension GradesWidget {
    struct PlaceholderView : View {
        var body: some View {
            Text("Loading...")
        }
    }
}
