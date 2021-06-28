//
//  RunShortcut.swift
//  ScriptingShortcuts
//
//  Created by Alex Hay on 28/06/2021.
//

import ScriptingBridge

@objc protocol ShortcutsEvents {
    @objc optional var shortcuts: SBElementArray { get }
}

@objc protocol Shortcut {
    @objc optional var name: String { get }
    @objc optional func run(withInput: Any?) -> Any?
}

extension SBApplication: ShortcutsEvents {}
extension SBObject: Shortcut {}

// MARK: RUN A SHORTCUT
func runShortcut(name: String, input: String) -> String? {
    print("⚙️ Trying to run shortcut named '\(name)'...")
    guard
        let app: ShortcutsEvents = SBApplication(bundleIdentifier: "com.apple.shortcuts.events"),
        let shortcuts = app.shortcuts else {
            print("⛔️ Couldn't access shortcuts")
            return nil
        }

    guard let shortcut = shortcuts.object(withName: name) as? Shortcut else {
        print("⚠️ Shortcut doesn't exist")
        return nil
    }

    return shortcut.run?(withInput: input) as? String
}

// MARK: GET A LIST OF ALL SHORTCUTS IN THE LIBRARY
func listShortcuts() -> [String] {
    print("⚙️ Trying to fetch the names of all shortcuts...")
    guard
        let app: ShortcutsEvents = SBApplication(bundleIdentifier: "com.apple.shortcuts.events"),
        let shortcuts = app.shortcuts else {
            print("⛔️ Couldn't access shortcuts")
            return []
        }
    
    let shortcutNames = shortcuts.compactMap({ ($0 as? Shortcut)?.name })
    return shortcutNames.sorted()
}
