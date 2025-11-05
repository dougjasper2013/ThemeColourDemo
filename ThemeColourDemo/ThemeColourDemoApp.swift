//
//  ThemeColourDemoApp.swift
//  ThemeColourDemo
//
//  Created by Douglas Jasper on 2025-11-05.
//

import SwiftUI

@main
struct ThemeColourDemoApp: App {
    @StateObject private var settings = Settings()

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(settings)
                .preferredColorScheme(colorScheme(for: settings.themeMode))
        }
    }

    private func colorScheme(for mode: ThemeMode) -> ColorScheme? {
        switch mode {
        case .system: return nil
        case .light:  return .light
        case .dark:   return .dark
        }
    }
}
