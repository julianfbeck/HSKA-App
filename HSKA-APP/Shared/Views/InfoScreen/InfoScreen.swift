//
//  Infoscreen.swift
//  Shared
//
//  Created by Julian Beck on 11.09.20.
//

import Foundation
import SwiftUI

struct InfoScreen: View {

    
    var body: some View {
        ZStack {
            Color.red.edgesIgnoringSafeArea(.top)
            List {
                SendFeedbackSectionView()
                AppInfoSectionView()
                VStack() {
                    Text("Created with ❤️ by Julian Beck")
                        .foregroundColor(.secondary)
                        .fontWeight(.semibold)
                        .font(.system(size: 14))
                    appVersionView
                        .foregroundColor(.secondary)
                        .font(.system(size: 12))
                }
                .frame(minWidth: 0, maxWidth: .infinity, alignment: .center)
                
            }
            .listStyle(GroupedListStyle())
                
            .environment(\.horizontalSizeClass, .regular)
            .cornerRadius(20, corners: [.topLeft, .topRight])
            
        }.navigationBarTitle("Settings")
        
        
    }
    
    private var appVersionView: some View {
        if let version = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String,
            let build = Bundle.main.infoDictionary?["CFBundleVersion"] as? String {
            
            return Text("Version: \(version) (\(build))")
        } else {
            return Text("#chad")
        }
    }
}

struct InfoScreen_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            InfoScreen()
                .environment(\.colorScheme, .dark)
            InfoScreen()
                .environment(\.colorScheme, .light)
        }
        
    }
}




extension URL {
    private static let iOSID = "id1524307153"
    
    
    enum appLinks: String {
        
        #if os(iOS)
        case appStore = "itms-apps://itunes.apple.com/app/id1524307153"
        case rateApp = "itms-apps://itunes.apple.com/app/id1524307153?action=write-review"
        #endif
        
        case twitter = "https://twitter.com/Kickbeak"
        case github = "https://github.com/jufabeck2202/HSKA-App"
        case privacyPolicy = "https://docs.google.com/document/d/1OAb_pW5Pls659u0ezjfwdH3qcjwXPFy6PVrfQsL5DGI/edit?usp=sharing"
        
        
    }
    
    init?(link: appLinks) {
        self.init(string: link.rawValue)
    }
    
    static func open(link: appLinks) {
        if let url = URL(link: link),
            UIApplication.shared.canOpenURL(url){
            UIApplication.shared.open(url, options: [:])
        }
    }
}
