//
//  SettingsView.swift
//  CuttingBoard
//
//  Created by Dustin Olsen on 6/13/23.
//

import SwiftUI

struct SettingsView: View {
    
    var uselessPickerChoices = ["Placeholder One", "Placeholder Two", "Placeholder Three"]
    @State private var uselessSelection = "Useless One"
    
    @State private var uselessToggle = false
    @State private var anotherUselessToggle = false
    
    var body: some View {
        
        Form {
            
            Section(header: Text("Placeholder Header")) {
                Toggle("Useless Toggle", isOn: $uselessToggle)
                
            }
            
            Section(header: Text("Placeholder Header #2")) {
                
                Toggle("Another Useless Toggle", isOn: $anotherUselessToggle)
                
            }
            
            Section(header: Text("Placeholder Header #3")) {
                
                Picker("Categories", selection: $uselessSelection, content: {
                    
                    ForEach(uselessPickerChoices, id: \.self) { things in
                        Text("\(things)")
                    }
                    
                })
            }
            
            Section(header: Text("Placeholder Header #4")) {
                
                Text("Placeholder Text")
                
            }
            
        }
        
    }
}

#Preview {
    SettingsView()
}
