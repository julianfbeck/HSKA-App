//
//  Header.swift
//  HSKA-Scanner
//
//  Created by Julian Beck on 13.09.20.
//

import SwiftUI
struct Header<Content>: View where Content: View {
    let title: String
    let content: () -> Content
    
    init(title: String, @ViewBuilder content: @escaping () -> Content) {
        self.content = content
        self.title = title
    }
    
    var InfoButton: some View {
        NavigationLink(destination: InfoScreen()) {
            Image(systemName: "info.circle").customIcon().onAppear(perform: {
                print("")
            })
        }
    }
    

    var body: some View {
        NavigationView {
            ZStack {
                Color.red.edgesIgnoringSafeArea(.all)
                    content()
                .background(Color(UIColor.systemBackground))
                .cornerRadius(20)
                .edgesIgnoringSafeArea(.bottom)
            }.navigationBarTitle(Text(self.title))
            .navigationBarItems(leading: InfoButton)
        }
    }

}
