//
//  Item.swift
//  CuttingBoard
//
//  Created by Dustin Olsen on 6/8/23.
//

import Foundation
import SwiftData

@Model
final class Item {
    var timestamp: Date
    
    init(timestamp: Date) {
        self.timestamp = timestamp
    }
}


@Model
final class Recipe {
    var name: String
    var ingredients: [String]
    
    init(name: String, ingredients: [String]) {
        self.name = name
        self.ingredients = ingredients
    }
}


@Model
final class Meal {
    var name: String
    var parts = [Recipe]()
    
    init(name: String, parts: [Recipe]) {
        self.name = name
        self.parts = parts
    }
}


@Model
final class Day {
    var breakfast: Meal?
    var lunch: Meal?
    var dinner: Meal?
    
    init(breakfast: Meal?, lunch: Meal?, dinner: Meal?) {
        self.breakfast = breakfast
        self.lunch = lunch
        self.dinner = dinner
    }
}


@Model
final class Week {
    var monday: Day
    var tuesday: Day
    var wednesday: Day
    var thursday: Day
    var friday: Day
    var saturday: Day
    var sunday: Day
    
    init(monday: Day, tuesday: Day, wednesday: Day, thursday: Day, friday: Day, saturday: Day, sunday: Day) {
        self.monday = monday
        self.tuesday = tuesday
        self.wednesday = wednesday
        self.thursday = thursday
        self.friday = friday
        self.saturday = saturday
        self.sunday = sunday
    }
}
