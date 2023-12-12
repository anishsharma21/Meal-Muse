import SwiftUI

struct GeneratedMealsView: View {
    @State private var meals = [Meal]()
    
    var body: some View {
        NavigationView {
            List(meals) { meal in
                VStack(alignment: .leading) {
                    Text(meal.name)
                        .font(.headline)
                    Text("Calories: \(meal.calories)")
                    Text("Cooking Time: \(meal.cookingTime) minutes")
                    Text("Ingredients: \(meal.ingredients.joined(separator: ", "))")
                }
            }
            .navigationBarTitle("Meals")
            .onAppear(perform: loadMeals)
        }
    }
    
    func loadMeals() {
        guard let url = Bundle.main.url(forResource: "meals", withExtension: "json") else {
            print("meals.json file not found")
            return
        }
        
        do {
            let data = try Data(contentsOf: url)
            meals = try JSONDecoder().decode([Meal].self, from: data)
        } catch {
            print("Error decoding JSON: \(error)")
        }
    }
}

struct GeneratedMealsView_Previews: PreviewProvider {
    static var previews: some View {
        GeneratedMealsView()
    }
}
