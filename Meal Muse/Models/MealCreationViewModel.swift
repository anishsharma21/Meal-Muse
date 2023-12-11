import Foundation

import SwiftUI

class MealCreationViewModel: ObservableObject {
    @Published var userPreferences: [Int: String?] = [:]
    @Published var currentQuestionIndex: Int = 0

    let questions: [Question] = [
        Question(title: "What type of diet are you adhering to?", options: ["Vegan", "Vegetarian", "Carnivore", "Pescetarian", "Paleo", "Keto", "Mediterranean", "No preference"]),
        Question(title: "What are your macro nutrient requirements?", options: ["High Protein", "High Carbs", "High Fat", "Balanced", "Low Carb", "Low Fat", "Low Protein"]),
        Question(title: "How many calories should this meal have?", options: ["Under 100", "100 - 250", "250 - 500", "500 - 750", "750 - 1000", "1000+"]),
        Question(title: "Preferred meal time", options: ["Breakfast", "Lunch", "Snack", "Dinner", "Dessert"]),
        Question(title: "Desired cooking time", options: ["Under 15 minutes", "15-30 minutes", "30-45 minutes", "45-60 minutes", "Over an hour"])
        // ... add more questions as needed
    ]

    func toggleOptionSelection(questionIndex: Int, option: String) {
        if let currentSelection = userPreferences[questionIndex], currentSelection == option {
            userPreferences[questionIndex] = nil // Deselect if the same option is selected again
        } else {
            userPreferences[questionIndex] = option // Select the new option
        }
    }
}


