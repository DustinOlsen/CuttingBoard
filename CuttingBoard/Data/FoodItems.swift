//
//  FoodItems.swift
//  CuttingBoard
//
//  Created by Dustin Olsen on 6/27/23.
//

import Foundation


struct FoodCategory: Codable, Hashable {
    let name: String
    let foods: [String]
    

}

struct FoodData: Codable {
    let categories: [FoodCategory]
}
