import SwiftUI

struct Meal: Decodable, Identifiable {
    var id: String// = UUID() // This provides a unique identifier for each meal.
    var name: String
    var calories: Int
    var ingredients: [String]
    var cookingTime: Int // Assuming this is in minutes.
}
