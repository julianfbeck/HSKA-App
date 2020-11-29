//
//  DatesTabView.swift
//  Shared
//
//  Created by Julian Beck on 13.09.20.
//

import SwiftUI


struct DatesTabView: View {
    @ObservedObject private var viewModel = DatesViewModel(client: .init())
    @State private var selectedSemester = DatesSemester.current
    @State private var  heading = "Dates"
    var body: some View {
        Header(title: "Dates \(viewModel.dateInfo?.semesterName ?? "")"){
            VStack {
                Picker(selection: $selectedSemester, label: Text("")) {
                    Text("Current").tag(DatesSemester.current)
                    Text("Next").tag(DatesSemester.next)

                }.onChange(of: selectedSemester, perform: { (value) in
                    self.viewModel.update(for: self.selectedSemester)
                    HapticFeedback.play(.selection)
                }).pickerStyle(SegmentedPickerStyle())
                .padding([.top, .leading, .trailing])
                List {
                    ForEach(self.viewModel.dateInfo?.entries ?? [], id: \.id) { entry in
                       DateListItemView(entry: entry)
                    }
                
                }.listStyle(GroupedListStyle())
            }
        }
       
    }
}

struct DatesTabView_Previews: PreviewProvider {
    static var previews: some View {
        DatesTabView()
    }
}
