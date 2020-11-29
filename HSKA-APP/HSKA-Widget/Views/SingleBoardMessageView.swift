//
//  SingleBoardMessageView.swift
//  Shared
//
//  Created by Julian Beck on 20.07.20.
//
import SwiftUI
import WidgetKit

public struct BlackBoardMessageWidgetView: View {
    let update: BlackBoardMessage
    @Environment(\.widgetFamily) var family

    public init(update: BlackBoardMessage) {
        self.update = update
    }

    var isSmall: Bool {
        family == .systemSmall
    }

    public var body: some View {
        GeometryReader { metrics in
            VStack {
                VStack(spacing: 0) {
                        Text(update.title).font(.system(.callout, design: .rounded)).fontWeight(.bold).frame(maxWidth: .infinity, alignment: .center)                            .foregroundColor(.white)
                        
                        Text(update.subTitle).font(.system(.subheadline, design: .rounded)).fontWeight(.semibold).frame(maxWidth: .infinity, alignment: .center).foregroundColor(.white)
                    //only display Content if Widget is not small
                    if !isSmall {
                        Text(update.content).font(.system(.body, design: .rounded)).foregroundColor(.white)
                    }
                       
                }.padding(.top, 10)
               Spacer()
            } .padding(.horizontal, 8)
            .frame(width: metrics.size.width)
            .background(LinearGradient(gradient: Gradient(colors: [Color(red: 223/255, green: 23/255, blue: 28/255),Color(red: 131/255, green: 19/255, blue: 42/255)]), startPoint: .top, endPoint: .bottom))
        }
    }
}

struct BlackBoardMessageWidgetView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            BlackBoardMessageWidgetView(update:  testItem)            .previewContext(WidgetPreviewContext(family: .systemSmall))
                .previewDisplayName("Small widget")
                .environment(\.colorScheme, .dark)
            BlackBoardMessageWidgetView(update:  testItem)            .previewContext(WidgetPreviewContext(family: .systemMedium))
                .previewDisplayName("Small widget")
                .environment(\.colorScheme, .dark)
            BlackBoardMessageWidgetView(update:  testItem)            .previewContext(WidgetPreviewContext(family: .systemLarge))
                .previewDisplayName("Small widget")
                .environment(\.colorScheme, .dark)
        }
    }
}
