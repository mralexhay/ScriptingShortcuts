//
//  SidebarView.swift
//  ScriptingShortcuts
//
//  Created by Alex Hay on 29/06/2021.
//

import SwiftUI

struct SidebarView: View {
    
    @State var chosenNav: NavigationViewType? = .run
    
    var body: some View {
        NavigationView {
            List {
                NavigationLink("Run Shortcut", destination: RunShortcutView(), tag: .run, selection: $chosenNav)
                NavigationLink("List Shortcuts", destination: ListShortcutsView(), tag: .list, selection: $chosenNav)
            }
            .listStyle(SidebarListStyle())
        }
    }
    
    enum NavigationViewType: Hashable {
      case run
      case list
    }
}

struct SidebarView_Previews: PreviewProvider {
    static var previews: some View {
        SidebarView()
    }
}
