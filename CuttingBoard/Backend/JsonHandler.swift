//
//  JsonHandler.swift
//  CuttingBoard
//
//  Created by Dustin Olsen on 6/27/23.
//

import Foundation

func pullFoodData() -> FoodData? {
    
    guard let fileURL = Bundle.main.url(forResource: "CuttingBoardLists", withExtension: "JSON") else {
        // Handle the case when the JSON file is not found
        print("oops")
        return nil
    }
    
    do {
        let jsonData = try Data(contentsOf: fileURL)
        let decoder = JSONDecoder()
        let foodData = try decoder.decode(FoodData.self, from: jsonData)
        
        // Now you can work with the decoded data
        for category in foodData.categories {
            print("Category: \(category.name)")
            for food in category.foods {
                print("- Food: \(food)")
            }
            print("---")
        }
        return foodData
        
    } catch {
        // Handle the error when reading or decoding the JSON file
        print("Error reading JSON file: \(error)")
        return nil
    }
//    return nil
}

