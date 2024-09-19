//
//  Math_GameApp.swift
//  Math Game
//
//  Created by dwi prasetyo on 16/09/24.
//

import SwiftUI

@main
struct Math_GameApp: App {
    @State var highSCoreVm: HighScoreViewModel = HighScoreViewModel()
    var body: some Scene {
        WindowGroup {
            MainView()
                .environment(highSCoreVm)
        }
    }
}
