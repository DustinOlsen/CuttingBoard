//
//  MealPlanningView.swift
//  CuttingBoard
//
//  Created by Dustin Olsen on 6/13/23.
//

import SwiftUI
import SwiftData

struct MealPlanningView: View {
    
    @Environment(\.modelContext) private var modelContext
    @Query private var week: [Week]
    
    let daysOfWeek = ["Sunday", "Monday", "Tuesday", "Wednesday", "Thursday", "Friday", "Saturday"]
    
    var body: some View {
        VStack {
            
            ScrollView(.vertical) {
                VStack { 
                    // Grid of meal slots
                    ForEach(daysOfWeek, id: \.self) { day in
                        VStack {
                            // Day of the week
                            Text(day)
                                .font(.headline)
                                .padding(.vertical, 8)
                            
                            // Meal slots for the day
                            ForEach(0..<1) { _ in
                                Rectangle()
                                    .frame(height: 120)
                                    .foregroundColor(.gray)
                            }
                        }
                        .padding(.horizontal, 16)
                        .padding(.vertical, 8)
                    }
                }
                .padding(.horizontal, 16)
            }
        }
    }
}

#Preview {
    MealPlanningView()
}
