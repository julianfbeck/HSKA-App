//
//  BulletBoardView.swift
//  HSKA-Scanner
//
//  Created by Julian Beck on 13.09.20.
//

import SwiftUI





struct BulletBoardTabView: View {
    @ObservedObject private var viewModel = BlackBoardViewModel(client: .init())
    @State private var courseType = CourseOfStudy.all

    var body: some View {
        Header(title: "Bulletin Board"){
            VStack {
                Picker(selection: $courseType, label: Text("")) {
                    Text("All").tag(CourseOfStudy.all)
                    Text("INFB").tag(CourseOfStudy.infb)
                    Text("INFM").tag(CourseOfStudy.infm)
                    Text("MINB").tag(CourseOfStudy.minb)
                    Text("MKIB").tag(CourseOfStudy.mkib)
                }.onChange(of: courseType, perform: { (value) in
                    self.viewModel.update(for: self.courseType)
                    HapticFeedback.play(.selection)
                }).pickerStyle(SegmentedPickerStyle())
                .padding([.top, .leading, .trailing])
                
                ScrollView(.vertical, showsIndicators: false) {
                    VStack(spacing: 10) {
                        ForEach(self.viewModel.messages, id: \.id) { update in
                            MessageLineView(update: update).padding([.trailing, .leading], 3)
                        }
                        
                        Text("").padding(.bottom,100)
                        
                    }
                }
            }
            
        }
        
    }
}

struct BulletBoardView_Previews: PreviewProvider {
    static var previews: some View {
        BulletBoardTabView().environment(\.colorScheme, .dark)
    }
}
