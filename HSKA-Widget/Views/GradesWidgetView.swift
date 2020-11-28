//
//  GradesWidgetView.swift
//  HSKA-WidgetExtension
//
//  Created by Julian Beck on 14.09.20.
//

import SwiftUI
import WidgetKit

struct GradesWidgetView: View {
    let entry: GradesEntry
    @Environment(\.widgetFamily) var family
    
    var body: some View {
        if let latestGrade = entry.grades?.grades?.first {
            GradesWidgetContentView(grade: latestGrade)
            
        } else if !LoginService.isLogedIn {
            EmptyGradesView(displayText: "Please Log In")
        } else {
            EmptyGradesView(displayText: "No Grades Found")
        }
    }
    
    
}

struct GradesWidgetContentView: View {
    let grade: Grade
    @Environment(\.widgetFamily) var family
    
    var body: some View {
        ZStack {
            VStack (spacing: 0){
                LinearGradient.widgetGradient.frame(maxHeight: 26)
                Color(UIColor.secondarySystemBackground)
                
            }
            HStack {
                VStack(alignment: .leading) {
                    VStack(alignment: .leading, spacing: 4) {
                        Text("Last Grade").font(.headline).foregroundColor(Color.white).padding(.top, 5)
                        Text(grade.examName ?? "").font(.headline).foregroundColor(Color(UIColor.label))
                    }
                    
                    Spacer()
                    
                    VStack(alignment: .leading, spacing: 4) {
//                        if (grade.grade != 0) {
//                            
//                            HStack(alignment: .firstTextBaseline ) {
//                                Text("Grade ").font(.headline).foregroundColor(Color(UIColor.secondaryLabel))
//                                Text("\(grade.wrappedGrade)").font(.system(.title, design: .rounded)).fontWeight(.bold)
//                            }
//                        }
                        if (grade.status == "bestanden"){
                            HStack(spacing: 10) {
                                Image(systemName: "checkmark.circle")
                                    .font(.system(size: 15, weight: .bold))
                                    .foregroundColor(Color(UIColor.systemGreen))
                                    .frame(width: 12, height: 12)
                                    .contentShape(Rectangle())
                                
                                Text(grade.wrappedStatus ).font(.subheadline).foregroundColor(Color(UIColor.systemGreen))
                            }.padding(.leading, 10)
                        } else {
                            HStack(spacing: 10) {
                                Image(systemName: "bolt")
                                    .font(.system(size: 15, weight: .bold))
                                    .foregroundColor(Color(UIColor.systemRed))
                                    .frame(width: 12, height: 12)
                                    .contentShape(Rectangle())
                                
                                Text(grade.wrappedStatus ).font(.subheadline).foregroundColor(Color(UIColor.systemRed))
                            }.padding(.leading, 10)
                        }
                        
                        
                    }
                }
                
                Spacer()
                if (family == .systemMedium) {
                    VStack(alignment: .trailing, spacing: 4) {
                        Text(grade.examNumber ?? "").font(.headline).foregroundColor(Color(UIColor.secondaryLabel))
                        Text(grade.examSemester ?? "").font(.system(.title, design: .rounded)).fontWeight(.bold)
                        Text(grade.date ?? "").font(.headline).foregroundColor(Color(UIColor.secondaryLabel))
                    }
                }
            }
            .padding([.bottom, .leading, .trailing], 10)
            
        }
        
    }
}

struct EmptyGradesView: View {
    
    @Environment(\.widgetFamily) var family
    public var displayText: String
    
    var body: some View {
        ZStack {
            Color(UIColor.secondarySystemBackground)
            
            VStack(alignment: .leading) {
                Text(displayText).font(.system(.title, design: .rounded)).fontWeight(.bold)
                
            }
            .padding()
            .overlay(
                RoundedRectangle(cornerRadius: 20)
                    .stroke(Color.red, lineWidth: 5)
            )
            .frame(width:family == .systemMedium ? 300 : 155 , height: 155)

            .padding()
            
        }
        
    }
}

struct GradesWidgetView_Previews: PreviewProvider {
    static var previews: some View {
        Group{
            GradesWidgetView(entry: GradesEntry(date: Date(), grades: gradeTestItem, isLoggedIn: true))
                .previewContext(WidgetPreviewContext(family: .systemSmall))
                .previewDisplayName("Small widget")
                .environment(\.colorScheme, .dark)
            GradesWidgetView(entry: GradesEntry(date: Date(), grades: gradeTestItem, isLoggedIn: true))
                .previewContext(WidgetPreviewContext(family: .systemSmall))
                .previewDisplayName("Small widget")
                .environment(\.colorScheme, .light)
            GradesWidgetView(entry: GradesEntry(date: Date(), grades: gradeTestItem, isLoggedIn: true))
                .previewContext(WidgetPreviewContext(family: .systemMedium))
                .previewDisplayName("Small widget")
                .environment(\.colorScheme, .dark)
            GradesWidgetView(entry: GradesEntry(date: Date(), grades: gradeTestItem, isLoggedIn: true))
                .previewContext(WidgetPreviewContext(family: .systemMedium))
                .previewDisplayName("Small widget")
                .environment(\.colorScheme, .light)
        }
    }
}
