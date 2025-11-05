//
//  SettingsKeys.swift
//  ThemeColourDemo
//
//  Created by Douglas Jasper on 2025-11-05.
//

enum SettingsKeys {
    static let themeMode = "theme_mode"
    static let backgroundColour = "background_colour"
}

enum ThemeMode: String {
    case system
    case light
    case dark
}

enum BackgroundColour: String {
    case white
    case lightGray
    case yellow
    case blue
}
