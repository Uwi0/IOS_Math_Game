//
//  Math_GameApp.swift
//  Math Game
//
//  Created by dwi prasetyo on 16/09/24.
//

import SwiftUI

@main
struct Math_GameApp: App {
    @StateObject var highSCoreVm: HighScoreViewModel = .init()
    var body: some Scene {
        WindowGroup {
            MainView()
                .environmentObject(highSCoreVm)
        }
    }
}
