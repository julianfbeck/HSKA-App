//
//  HapticFeedback.swift
//  Shared
//
//  Created by Julian Beck on 11.09.20.
//

import Foundation
import SwiftUI

public class HapticFeedback {

    public enum FeedbackStyle {
        case success
        case selection
        case error
        case warning
        case impactSoft
        case impactLight
        case impactMedium
        case impactHeavy
        case impactRigid
    }
    
    public static func play (_ type:FeedbackStyle){
        switch type {
        case .success:
            let generator = UINotificationFeedbackGenerator()
                            generator.notificationOccurred(.success)
        case .selection:
            //iOS implementation
                UISelectionFeedbackGenerator().selectionChanged()
        case .error:
            let generator = UINotificationFeedbackGenerator()
                       generator.notificationOccurred(.error)
        case .warning:
            let generator = UINotificationFeedbackGenerator()
                       generator.notificationOccurred(.warning)
        case .impactSoft:
            let generator = UIImpactFeedbackGenerator(style: .soft)
                      generator.impactOccurred()
        case .impactLight:
            let generator = UIImpactFeedbackGenerator(style: .light)
                      generator.impactOccurred()
        case .impactMedium:
            let generator = UIImpactFeedbackGenerator(style: .medium)
                      generator.impactOccurred()
        case .impactHeavy:
            let generator = UIImpactFeedbackGenerator(style: .heavy)
                      generator.impactOccurred()
        case .impactRigid:
            let generator = UIImpactFeedbackGenerator(style: .rigid)
                      generator.impactOccurred()
        }
    }
}
