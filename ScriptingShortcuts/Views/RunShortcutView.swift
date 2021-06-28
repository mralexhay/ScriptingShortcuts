//
//  ContentView.swift
//  ScriptingShortcuts
//
//  Created by Alex Hay on 28/06/2021.
//

import SwiftUI

struct RunShortcutView: View {
    
    @State var output = ""
    
    var body: some View {
        VStack(alignment: .leading) {
            RunDescriptionView()
            TextEntryView(output: $output)
            OutputView(output: $output)
            Spacer()
        }
        .padding()
    }
}

struct RunDescriptionView: View {

    var body: some View {
        Text("Run Test")
            .font(.largeTitle.bold())
            .padding(.bottom, 5)
        Text("Enter the name of a shortcut in your library below. Hit the button to run it.")
            .foregroundColor(.secondary)
            .font(.caption)
    }
}

struct TextEntryView: View {

    @State var shortcutName = ""
    @Binding var output: String
    @State var showingAlert = false
    
    var body: some View {
        VStack {
            TextField("Shortcut Name", text: $shortcutName)
            HStack {
                Spacer()
                Button(action: {
                    if let newOutput = runShortcut(name: shortcutName, input: "") {
                        output = newOutput
                    } else {
                        // Present an alert if there's no output from the shortcut
                        showingAlert.toggle()
                    }
                }, label: {
                    Text("Run Shortcut")
                })
            }
        }
        .padding(.vertical)
        .alert("There was no output from the shortcut '\(shortcutName)'", isPresented: $showingAlert) {
                    Button("OK", role: .cancel) { }
                }
    }
}

struct OutputView: View {
    
    @Binding var output: String

    var body: some View {

        // Display shortcut output if there is any
        if output != "" {
            GroupBox(label: Text("Output")) {
                Text(output)
            }
        }
    }
}

struct RunShortcutView_Previews: PreviewProvider {
    static var previews: some View {
        RunShortcutView()
    }
}
