//
//  Settings.swift
//  ThemeColourDemo
//
//  Created by Douglas Jasper on 2025-11-05.
//

import SwiftUI
import Combine

final class Settings: ObservableObject {
    @Published var themeMode: ThemeMode = .system
    @Published var backgroundColour: BackgroundColour = .white

    private var defaults: UserDefaults

    init(defaults: UserDefaults = .standard) {
        self.defaults = defaults
        load()
        NotificationCenter.default.addObserver(self,
                                               selector: #selector(defaultsChanged),
                                               name: UserDefaults.didChangeNotification,
                                               object: defaults)
    }
    deinit {
        NotificationCenter.default.removeObserver(self)
    }

    func load() {
        if let rawTheme = defaults.string(forKey: SettingsKeys.themeMode),
           let mode = ThemeMode(rawValue: rawTheme) {
            themeMode = mode
        } else {
            themeMode = .system
        }

        if let rawColour = defaults.string(forKey: SettingsKeys.backgroundColour),
           let col = BackgroundColour(rawValue: rawColour) {
            backgroundColour = col
        } else {
            backgroundColour = .white
        }
    }

    @objc private func defaultsChanged() {
        load()
    }

    func colourValue() -> Color {
        switch backgroundColour {
        case .white:     return Color.white
        case .lightGray: return Color(.lightGray)
        case .yellow:    return Color.yellow
        case .blue:      return Color.blue
        }
    }
}
