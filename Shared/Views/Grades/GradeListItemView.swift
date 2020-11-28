//
//  GradeListItemView.swift
//  HSKA-Scanner
//
//  Created by Julian Beck on 13.09.20.
//

import SwiftUI

struct GradeListItemView: View {
    let grade: Grade
    
    var body: some View {
        ZStack {
            VStack (spacing: 0){
                LinearGradient.widgetGradient.frame(maxHeight: 26)
                Color(UIColor.secondarySystemBackground)
                
            }
            HStack {
                VStack(alignment: .leading) {
                    VStack(alignment: .leading, spacing: 4) {
                        Text(grade.examNumber ?? "").font(.headline).foregroundColor(Color.white).padding(.top, 5)
                        Text(grade.examName ?? "").font(.headline).foregroundColor(Color(UIColor.label))
                    }
                    
                    Spacer()
                    
                    VStack(alignment: .leading, spacing: 4) {
                        if (grade.grade != 0) {
                            
                            HStack(alignment: .firstTextBaseline ) {
                                Text("Grade ").font(.headline).foregroundColor(Color(UIColor.secondaryLabel))
                                Text("\(grade.wrappedGrade)").font(.system(.title, design: .rounded)).fontWeight(.bold)
                            }
                        }
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
                VStack(alignment: .trailing, spacing: 4) {
                    Spacer()
                    Text("Attempts: \(grade.attempt ?? 0)").font(.headline).foregroundColor(Color(UIColor.secondaryLabel)).padding(.top)
                    Text(grade.examSemester ?? "").font(.system(.title, design: .rounded)).fontWeight(.bold)
                    Text(grade.date ?? "").font(.headline).foregroundColor(Color(UIColor.secondaryLabel))
                }
                
            }
            .padding([.bottom, .leading, .trailing], 10)
            
        }
        .cornerRadius(6).padding([.bottom, .leading, .trailing],3)
        
    }
    
}

struct GradeListItemView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            GradeListItemView(grade: gradeTestItem.grades![0])
                .environment(\.colorScheme, .dark)
            GradeListItemView(grade: gradeTestItem.grades![0])
                .environment(\.colorScheme, .light)
        }    }
}
