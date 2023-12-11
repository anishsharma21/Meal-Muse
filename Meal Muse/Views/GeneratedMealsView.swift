//
//  GeneratedMealsView.swift
//  Meal Muse
//
//  Created by Anish Sharma on 12/12/2023.
//

import Foundation

import SwiftUI

struct GeneratedMealsView: View {
    @State private var meals = [String]()

    var body: some View {
        NavigationView {
            List(meals, id: \.self) { meal in
                Text(meal)
            }
            .navigationBarTitle("Meals")
            .onAppear(perform: loadMeals)
        }
    }

    func loadMeals() {
        if let fileURL = Bundle.main.url(forResource: "meals", withExtension: "txt") {
            if let fileContents = try? String(contentsOf: fileURL) {
                meals = fileContents.components(separatedBy: "\n").filter { !$0.isEmpty }
            }
        }
    }
}

struct MealListView_Previews: PreviewProvider {
    static var previews: some View {
        GeneratedMealsView()
    }
}
