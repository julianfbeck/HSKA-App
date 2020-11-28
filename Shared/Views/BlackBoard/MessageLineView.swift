//
//  MessageLineView.swift
//  Shared
//
//  Created by Julian Beck on 20.07.20.
//


import SwiftUI

struct MessageLineView: View {
    let update: BlackBoardMessage
    var body: some View {
            VStack(alignment: .center) {
                Text(update.title).font(.system(.callout, design: .rounded)).fontWeight(.bold).frame(maxWidth: .infinity, alignment: .center)                            .foregroundColor(.white)
                
                Text(update.subTitle).font(.system(.subheadline, design: .rounded)).fontWeight(.semibold).frame(maxWidth: .infinity, alignment: .center).foregroundColor(.white).padding(.bottom)
                Text(update.content).font(.system(.body, design: .rounded)).foregroundColor(.white).padding(.bottom, 1)
                
            }.padding()
            .background(LinearGradient(gradient: Gradient(colors: [Color(red: 223/255, green: 23/255, blue: 28/255),Color(red: 131/255, green: 19/255, blue: 42/255)]), startPoint: .top, endPoint: .bottom))
            .cornerRadius(15)
        
    }
}


struct MessageLineView_Preview: PreviewProvider {
    
    static var previews: some View {
        MessageLineView(update: testItem)
    }
}
