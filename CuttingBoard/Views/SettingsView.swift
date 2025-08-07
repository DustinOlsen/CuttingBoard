//
//  SettingsView.swift
//  CuttingBoard
//
//  Created by Dustin Olsen on 6/13/23.
//

import SwiftUI

struct SettingsView: View {
    
    var uselessPickerChoices = ["Useless One", "Useless Two", "Useless Three"]
    @State private var uselessSelection = "Useless One"
    
    @State private var uselessToggle = false
    @State private var anotherUselessToggle = false
    
    var body: some View {
        
        Form {
            
            Section(header: Text("Uhhh")) {
                Toggle("Useless Toggle", isOn: $uselessToggle)
                
            }
            
            Section(header: Text("uhh....UHHHHHHH")) {
                
                Toggle("Another Useless Toggle", isOn: $anotherUselessToggle)
                
            }
            
            Section(header: Text("I don't even know what this is for")) {
                
                Picker("Categories", selection: $uselessSelection, content: {
                    
                    ForEach(uselessPickerChoices, id: \.self) { things in
                        Text("\(things)")
                    }
                    
                })
            }
            
            Section(header: Text("Some other thing here")) {
                
                Text("Idk")
                
            }
            
        }
        
    }
}

#Preview {
    SettingsView()
}
