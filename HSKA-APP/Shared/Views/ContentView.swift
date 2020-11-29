//
//  ContentView.swift
//  HSKA-Scanner
//
//  Created by Julian Beck on 19.07.20.
//

import SwiftUI
struct ContentView: View {

    init() {
        UINavigationBar.appearance().largeTitleTextAttributes = [.foregroundColor: UIColor.white]
        UINavigationBar.appearance().titleTextAttributes = [.foregroundColor: UIColor.white]
    }
    
    var body: some View {
        TabView {
            BulletBoardTabView()
           .tabItem {
                Image(systemName: "list.bullet.below.rectangle")
                Text("Bulletinboard")
            }
            GradesTabView()
                .tabItem {
                     Image(systemName: "rosette")
                     Text("Grades")
                 }
            DatesTabView()
                .tabItem {
                     Image(systemName: "calendar")
                     Text("Dates")
                 }

        }
        
    }
}


struct ContentView_Previews: PreviewProvider {
    
    static var previews: some View {
        ContentView()
    }
}
