//
//  SendFeedbackSectionView.swift
//  Shared
//
//  Created by Julian Beck on 11.09.20.
//

import SwiftUI
import MessageUI

struct SendFeedbackSectionView: View {

    @State private var isShowingMailView = false
    @State private var result: Result<MFMailComposeResult, Error>? = nil
    
    var body: some View {
        Section(header: Text("Send Feedback").font(.headline)) {

            //MARK: - Email
            Button(action: {
                self.isShowingMailView.toggle()
            }) {
                SettingsRowView(
                    image: Image(systemName: "envelope.circle.fill"),
                    imageColor: Color(UIColor.systemBlue),
                    title: "Email"
                )
            }
            .disabled(!MFMailComposeViewController.canSendMail())
            .sheet(isPresented: $isShowingMailView) {
                MailView(result: self.$result)
            }
            
            //MARK: - GITHUB
            Button(action: {
                URL.open(link: .github)
            }) {
                SettingsRowView(
                    image: Image(iconName: .github),
                    imageColor: Color(UIColor.systemBlue),
                    title: "Source Code"
                )
            }

            //MARK: - Twitter
            Button(action: {
                URL.open(link: .twitter)
            }) {
                SettingsRowView(
                    image: Image(iconName: .twitter),
                    imageColor: Color(UIColor.systemBlue),
                    title: "Twitter"
                )
            }

            //MARK: - Rate in the App Store
            Button(action: {
                URL.open(link: .rateApp)
            }) {
                SettingsRowView(
                    image: Image(systemName: "star.circle.fill"),
                    imageColor: Color(UIColor.systemYellow),
                    title: "Rate in App Store"
                )
            }
        }

    }
}

struct SendFeedbackSectionView_Previews: PreviewProvider {
    static var previews: some View {
        SendFeedbackSectionView()
    }
}
