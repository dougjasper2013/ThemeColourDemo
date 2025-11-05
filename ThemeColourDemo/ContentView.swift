//
//  ContentView.swift
//  ThemeColourDemo
//
//  Created by Douglas Jasper on 2025-11-05.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.scenePhase) private var scenePhase
    @EnvironmentObject var settings: Settings

    var body: some View {
        VStack(spacing: 20) {
            Text("Theme: \(settings.themeMode.rawValue.capitalized)")
            Text("Background: \(settings.backgroundColour.rawValue.capitalized)")
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(settings.colourValue().ignoresSafeArea())
        .onChange(of: scenePhase) { newPhase in
            if newPhase == .active {
                settings.load()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
                .environmentObject(Settings())
                .preferredColorScheme(.light)
                .previewDisplayName("Light Mode")
            ContentView()
                .environmentObject(Settings())
                .preferredColorScheme(.dark)
                .previewDisplayName("Dark Mode")
        }
    }
}
