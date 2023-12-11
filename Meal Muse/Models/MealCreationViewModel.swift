import Foundation

import SwiftUI

class MealCreationViewModel: ObservableObject {
    @Published var userPreferences: [Int: Set<String>] = [:]
    @Published var currentQuestionIndex: Int = 0

    let questions: [Question] = [
        Question(title: "What type of diet are you adhering to?", options: ["Vegan", "Vegetarian", "Anything", "Pescetarian"]),
        Question(title: "What are your macro nutrient requirements?", options: ["High Protein", "High Fat", "High Carbs", "Low Carbs", "Low Protein", "Low Fat"]),
        // ... more questions
    ]

    func toggleOptionSelection(questionIndex: Int, option: String) {
        userPreferences[questionIndex] = [option] // Replace the set with just this option
    }

}

