//
//  ScriptingShortcutsApp.swift
//  ScriptingShortcuts
//
//  Created by Alex Hay on 28/06/2021.
//

import SwiftUI

@main
struct ScriptingShortcutsApp: App {
    
    var body: some Scene {
        WindowGroup {
            SidebarView()
            .frame(minWidth: 350, idealWidth: 400, maxWidth: 500, minHeight: 450, idealHeight: nil, maxHeight: nil, alignment: .center)
        }
    }
    
}
