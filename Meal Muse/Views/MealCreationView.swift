//
//  MealCreationView.swift
//  Meal Muse
//
//  Created by Anish Sharma on 11/12/2023.
//

import SwiftUI

struct MealCreationView: View {
    @State private var selectedDiets: Set<String> = []
    @State private var selectedMacros: Set<String> = []
    @State private var currentQuestion: Int = 1

    let dietOptions = ["Vegan", "Vegetarian", "Anything", "Pescetarian"]
    let macroOptions = ["High Protein", "High Fat", "High Carbs", "Low Carbs"]

    var body: some View {
        VStack {
            Text("Meal Creation Page")
                .font(.title)

            if currentQuestion == 1 {
                questionOneView
            } else if currentQuestion == 2 {
                questionTwoView
            }

            HStack {
                if currentQuestion > 1 {
                    Button(action: {
                        if currentQuestion > 1 {
                            currentQuestion -= 1
                        }
                    }) {
                        Text("Previous Question")
                            .padding()
                            .background(Color.gray)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                }

                Spacer()

                Button(action: {
                    if currentQuestion < 2 {
                        currentQuestion += 1
                    }
                }) {
                    Text("Next Question")
                        .padding()
                        .background(Color.blue)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                }
            }
        }
        .padding()
    }

    var questionOneView: some View {
        VStack {
            Text("What type of diet are you adhering to?")
                .font(.headline)
                .padding(.top)

            ForEach(dietOptions, id: \.self) { diet in
                CheckboxRow(title: diet, isSelected: selectedDiets.contains(diet)) {
                    if selectedDiets.contains(diet) {
                        selectedDiets.remove(diet)
                    } else {
                        selectedDiets.insert(diet)
                    }
                }
            }
        }
    }

    var questionTwoView: some View {
        VStack {
            Text("What are your macro nutrient requirements?")
                .font(.headline)
                .padding(.top)

            ForEach(macroOptions, id: \.self) { macro in
                CheckboxRow(title: macro, isSelected: selectedMacros.contains(macro)) {
                    if selectedMacros.contains(macro) {
                        selectedMacros.remove(macro)
                    } else {
                        selectedMacros.insert(macro)
                    }
                }
            }
        }
    }
}

struct CheckboxRow: View {
    var title: String
    var isSelected: Bool
    var action: () -> Void

    var body: some View {
        HStack {
            Text(title)
            Spacer()
            Image(systemName: isSelected ? "checkmark.square" : "square")
                .onTapGesture(perform: action)
        }
        .padding()
    }
}

// Preview
struct MealCreationView_Previews: PreviewProvider {
    static var previews: some View {
        MealCreationView()
    }
}

