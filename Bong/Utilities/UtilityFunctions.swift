//
//  UtilityFunctions.swift
//  Bong
//
//  Created by Nick Askari on 12/02/2023.
//

import Foundation
import SwiftUI

func portraitOrientationLock() {
    UIDevice.current.setValue(UIInterfaceOrientation.portrait.rawValue, forKey: "orientation")
    AppDelegate.orientationLock = .portrait
}

func getTapticFeedBack(style: UIImpactFeedbackGenerator.FeedbackStyle) {
    let impact = UIImpactFeedbackGenerator(style: style)
    impact.impactOccurred()
}
