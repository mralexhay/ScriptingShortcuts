//
//  ListShortcutsView.swift
//  ScriptingShortcuts
//
//  Created by Alex Hay on 29/06/2021.
//

import SwiftUI

struct ListShortcutsView: View {
    
    @State var shortcutNames: [String] = ["Test 1", "Test 2"]
    
    var body: some View {
        VStack(alignment: .leading) {
            ListDescriptionView()
            if shortcutNames.isEmpty { // Display a message if no shortcuts are listed
                HStack {
                    Spacer()
                    Text("Couldn't load shortcuts")
                        .foregroundColor(.secondary)
                        .font(.caption)
                        .padding()
                        .opacity(0.4)
                    Spacer()
                }
            } else {
                List {
                    ForEach(shortcutNames, id: \.self) { name in
                        Button(action: {
                            _ = runShortcut(name: name, input: "")
                        }, label: {
                            HStack {
                                Image(systemName: "play.circle")
                                Text(name)
                                Spacer()
                            }
                        })
                        .buttonStyle(.plain)
                    }
                }
            }
        }
        .padding()
        Spacer()
        .task {
            // Try and load the names of all shortcuts
            //shortcutNames = listShortcuts()
        }
    }
}

struct ListDescriptionView: View {

    var body: some View {
        Text("List Test")
            .font(.largeTitle.bold())
            .padding(.bottom, 5)
        Text("The names of every shortcut in your library should be listed below.")
            .foregroundColor(.secondary)
            .font(.caption)
    }
}

struct ListShortcutsView_Previews: PreviewProvider {
    static var previews: some View {
        ListShortcutsView()
    }
}
