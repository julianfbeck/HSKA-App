//
//  WidgetBundle.swift
//  Shared
//
//  Created by Julian Beck on 20.07.20.
//

import SwiftUI
import WidgetKit

@main
struct Widgets: WidgetBundle {
    @WidgetBundleBuilder
    var body: some Widget {
        SingleBoardMessageWidget()
        GradesWidget()
    }
}

struct Widgets_Previews: PreviewProvider {
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
