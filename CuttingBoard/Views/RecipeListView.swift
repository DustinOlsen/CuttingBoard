//
//  RecipeListView.swift
//  CuttingBoard
//
//  Created by Dustin Olsen on 6/10/23.
//

import SwiftUI
import SwiftData

struct RecipeListView: View {
    
    @Environment(\.modelContext) private var modelContext
    @Query private var recipes: [Recipe]
    
    @State private var showingNewRecipeView = false
    
    var body: some View {

        NavigationStack {
            
            
            if recipes.isEmpty {
                Text("There's no recipes here 😢")
            } else {
                
                List {
                    
                    
                    ForEach(recipes) { recipe in
                        NavigationLink {
                            VStack {
                                
                                
                                Text("Recipe: \(recipe.name)")
                                
                                List {
                                    ForEach(recipe.ingredients, id: \.self) { ingredient in
                                        Text(ingredient)
                                    }
                                }
                                
                            }
                            
                        } label: {
                            Text(recipe.name)
                        }
                    }
                    .onDelete(perform: deleteItems)
                    
                }
            }
            
            Text("Add a Recipe!")
            
                .navigationTitle(Text("Recipes"))
                .toolbar {
                    ToolbarItem(placement: .navigationBarTrailing) {
                        EditButton()
                    }
                    ToolbarItem {
                        Button(action: addItem) {
                            Label("Add Item", systemImage: "plus")
                        }
                    }
                }
        }
        .sheet(isPresented: $showingNewRecipeView) {
            NewRecipeView()
        }
    }
    
        private func addItem() {
            showingNewRecipeView.toggle()
        }
    
        private func deleteItems(offsets: IndexSet) {
            withAnimation {
                for index in offsets {
                    modelContext.delete(recipes[index])
                }
            }
        }
    
    
}

#Preview {
    RecipeListView()
}
