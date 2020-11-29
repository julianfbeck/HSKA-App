//
//  Extensions.swift
//  Shared
//
//  Created by Julian Beck on 11.09.20.
//
import SwiftUI

extension Font {
    public static var roundedHeadline = Font.system(size: 20, weight: .medium, design: .rounded)
    public static var roundedHeadlineBig = Font.system(size: 40, weight: .medium, design: .rounded)
    public static var roundedSmallerHeadline = Font.system(size: 25, weight: .medium, design: .rounded)
    public static var secondaryCallout = Font.system(size: 17, weight: .medium, design: .rounded)

}


extension LinearGradient {
    static let redGradient = LinearGradient(gradient: Gradient(colors: [Color(red: 223/255, green: 23/255, blue: 28/255),Color(red: 131/255, green: 19/255, blue: 42/255)]), startPoint: .top, endPoint: .center)
    static let widgetGradient = LinearGradient(gradient: Gradient(colors: [Color(#colorLiteral(red: 1, green: 0.2107787567, blue: 0.1673909133, alpha: 1)), Color(#colorLiteral(red: 0.9263293208, green: 0.3347176382, blue: 0.2870957163, alpha: 1))]), startPoint: .top, endPoint: .center)
}


extension Color {
    static var themeTextField: Color {
        return Color(red: 220.0/255.0, green: 230.0/255.0, blue: 230.0/255.0, opacity: 1.0)
    }
}

public struct RoundedCorner: Shape {
    
    var radius: CGFloat = .infinity
    var corners: UIRectCorner = .allCorners
    
    public func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}

struct IconModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.system(size: 17, weight: .heavy))
            .foregroundColor(Color.red)
            .frame(width: 32, height: 32)
            .background(
                Circle().fill(Color.white))
            .padding()
    }
}

extension View {
    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
        clipShape( RoundedCorner(radius: radius, corners: corners) )
    }
    
    func customIcon() -> ModifiedContent<Self, IconModifier> {
        return modifier(IconModifier())
    }
}

extension Image {
    enum IconNames: String {
        
        case twitter
        
        case github
        
    }
    
    init(iconName: IconNames) {
        self.init(decorative: iconName.rawValue)
    }
    
    func navigationBarStyle() -> some View {
        self
            .resizable()
            .aspectRatio(contentMode: .fit)
            .frame(width: Constants.navBarIcons, height: Constants.navBarIcons, alignment: .center)
    }
}

extension String {
    func toBase64() -> String {
           return Data(self.utf8).base64EncodedString()
       }
}
