//
//  NewRecipeView.swift
//  CuttingBoard
//
//  Created by Dustin Olsen on 6/21/23.
//

import SwiftUI
import SwiftData

struct NewRecipeView: View {
    
    @Environment(\.dismiss) var dismiss
    
    // SwiftData
    
    @Environment(\.modelContext) private var modelContext
    @Query private var recipes: [Recipe]
    
    private func saveRecipe() {
        let newRecipe = Recipe(name: recipeName, ingredients: selectedIngredients)
        modelContext.insert(newRecipe)
    }
    
    
    // JSON
    
    var foodData = pullFoodData()
    
    
    @State private var searchField = ""
    
    @State private var recipeName = ""
    @State var selectedCategory = FoodCategory(name: "Unselected", foods: [])
    
    
    
    @State private var finalizedTitle = false
    
    @State private var selectedIngredients = [String]()
    
    func appendToRecipe(_ food: String) {
        
        withAnimation {
            selectedIngredients.append(food)
            
        }
        
        
    }
    
    func isSelected(_ food: String) -> Bool {
        
        for selectedIngredient in selectedIngredients {
            if food == selectedIngredient {
                return true
            }
        }
        
        return false
    }
    
    func deleteIngredient(at offsets: IndexSet) {
           selectedIngredients.remove(atOffsets: offsets)
       }
    
    var body: some View {
        NavigationView {
            
            Form {
                
                if !finalizedTitle {
                    
                    Section(header: Text("Name It")) {
                        HStack {
                            TextField("Recipe Title", text: $recipeName)
                            Button("DONE") {
                                finalizedTitle.toggle()
                            }
                        }
                        
                    }
                }
                
                Section(header: Text("Arrange It")) {
                    
                    List {
                        
                        if selectedIngredients.count == 0 {
                            Spacer()
                        } else {
                            
                            ForEach(selectedIngredients, id: \.self) { ingredient in
                                
                                Text(ingredient)
                                
                            }
                            .onDelete(perform: deleteIngredient)
                        }
                    }
                }
                
                
                
//                Section(header: Text("Pick 'em")) {
                Section(header:
                            
                            
                            
                            Picker("Categories", selection: $selectedCategory, content: {
                    
                    ForEach(foodData!.categories, id: \.self) {category in
                        Text(category.name)
                    }
                    
                })) {
                    
                    TextField("Search", text: $searchField)
                    
                    
                    
                    
                    
                    
                    
                    ForEach(selectedCategory.foods, id: \.self) { food in
                        
                        HStack {
                            
                            Text(food).padding(0.7)
                                .onTapGesture {
                                    appendToRecipe(food)
                                }
                            
                            Spacer()
                            
                            Image(systemName: isSelected(food) ? "circle.fill" : "circle" )
                        
                        }
                    }
                    
                }
                
                
                Section(header: Text("We're Done Here")) {
                    HStack {
                        Button("Nevermind") {
                            dismiss()
                        }
                        .foregroundStyle(.red)
                        
                        Spacer()
                        
                        Button("Finalize That Shit") {
                            saveRecipe()
                        }
                    }
                }
            }
            .navigationTitle(Text("New Recipe"))
        }
        
    }
}

#Preview {
    NewRecipeView(selectedCategory: FoodCategory(name: "Preview", foods: [""]))
}
