//
//  ContentView.swift
//  CuttingBoard
//
//  Created by Dustin Olsen on 6/8/23.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @Query private var Recipe: [Recipe]
    
    @State private var isPresentingSheet = false
    
    var body: some View {
        
        ZStack {
            
            NavigationStack {
                TabView {
                    
                    RecipeListView()
//                    NewRecipeView()
                        .tabItem {
                            Text("Recipes")
                        }
                    
                    MealPlanningView()
                        .tabItem {
                            Text("Meal Planning")
                        }
                    
//                    Spacer()
                    
                    PantryView()
                        .tabItem {
                            Text("Pantry")
                        }
                    
                    SettingsView()
                        .tabItem {
                            Text("Settings")
                        }
                    
                }
                
                
            }
        }
    }
    
}

#Preview {
    ContentView()
        .modelContainer(for: Recipe.self, inMemory: true)
}
