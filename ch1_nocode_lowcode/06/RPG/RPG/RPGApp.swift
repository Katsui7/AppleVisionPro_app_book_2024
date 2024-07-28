//
//  RPGApp.swift
//  RPG
//
//  Created by 守下誠 on 2024/07/07.
//

import SwiftUI
import RealityKitContent

@main
struct RPGApp: App {
    
    init() {
        RealityKitContent.HandTrackingComponent.registerComponent()
        RealityKitContent.HandTrackingSystem.registerSystem()
    }

    @State private var appModel = AppModel()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(appModel)
        }

        ImmersiveSpace(id: appModel.immersiveSpaceID) {
            ImmersiveView()
                .environment(appModel)
                .onAppear {
                    appModel.immersiveSpaceState = .open
                }
                .onDisappear {
                    appModel.immersiveSpaceState = .closed
                }
        }
        .immersionStyle(selection: .constant(.mixed), in: .mixed)
     }
}
