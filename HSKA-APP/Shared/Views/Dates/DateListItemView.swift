//
//  DateListItemView.swift
//  HSKA-Scanner
//
//  Created by Julian Beck on 13.09.20.
//

import SwiftUI
struct DateListItemView: View {
     let entry: DatesEntry
    
    var body: some View
    {
                
            VStack (alignment: .leading){
                Text(self.entry.dateHint ?? "No Date").font(.roundedHeadline)
                if let time = entry.timeHint {
                    Text(time).font(.roundedHeadline)

                }
                Text(self.entry.description  ?? "no description").font(.secondaryCallout)
            }
            
        }
}
