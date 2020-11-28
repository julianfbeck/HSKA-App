//
//  AboutView.swift
//  Shared
//
//  Created by Julian Beck on 11.09.20.
//

import Foundation
import SwiftUI

struct AboutView: View {
    var body: some View {
        List {
            Section() {
                Text("HSKA IWI Checker")
                    .font(.system(size: 28))
                    .bold()
                    .frame(minWidth: 0, maxWidth: .infinity, alignment: .center)
            }

            Section() {
                VStack(alignment: .leading, spacing: 16) {
                    Text("👋 Hey, I'm Julian Beck,")
                    Text("I'm a computer science student at the University of applied sciences in Karlsruhe. Currently, I have a huge interest in learning Web techniques and Full Stack development as well as native App development. Besides that I love drinking coffee and seeing the world!")
                    
                    Text("The HSKA IWI App is a free App to show Grades and Blackboard Information fast and from the Homescreen. The App is fully Open Source")
                    Text("Thanks for downloading my App, I hope you enjoy it!")
                }
            }
        }
        .listStyle(GroupedListStyle())
        .environment(\.horizontalSizeClass, .regular)
        .navigationBarTitle("About", displayMode: .inline)
    }
}

struct AboutView_Previews: PreviewProvider {
    static var previews: some View {
        AboutView()
    }
}
