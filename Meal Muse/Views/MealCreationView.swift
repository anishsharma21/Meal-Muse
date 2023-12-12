import SwiftUI

struct MealCreationView: View {
    @StateObject var viewModel = MealCreationViewModel()
    @State private var showGeneratedMeals = false

    var body: some View {
        VStack {
            Text("Choose Your Meal Options")
                .font(.title)

            questionView

            HStack {
                if viewModel.currentQuestionIndex > 0 {
                    Button(action: {
                        viewModel.currentQuestionIndex -= 1
                    }) {
                        Text("Previous Question")
                            .padding()
                            .background(Color.gray)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                }

                Spacer()
                
                NavigationLink(destination: GeneratedMealsView(), isActive: $showGeneratedMeals) {
                    EmptyView()
                }
                
                // Check if it's the last question
                if viewModel.currentQuestionIndex < viewModel.questions.count - 1 {
                    Button(action: {
                        viewModel.currentQuestionIndex += 1
                    }) {
                        Text("Next Question")
                            .padding()
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                } else {
                    Button(action: {
                        self.showGeneratedMeals = true
                    }) {
                        Text("Find Recipes")
                            .padding()
                            .background(Color.purple) // Using yellow for gold color
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                }
            }
        }
        .padding()
    }

    var questionView: some View {
        let currentQuestion = viewModel.questions[viewModel.currentQuestionIndex]

        return VStack {
            Text(currentQuestion.title)
                .font(.headline)
                .padding(.top)

            ForEach(currentQuestion.options, id: \.self) { option in
                RadioButtonRow(title: option, isSelected: viewModel.userPreferences[viewModel.currentQuestionIndex] == option) {
                    viewModel.toggleOptionSelection(questionIndex: viewModel.currentQuestionIndex, option: option)
                }
            }
        }
    }
}

struct RadioButtonRow: View {
    var title: String
    var isSelected: Bool
    var action: () -> Void

    var body: some View {
        HStack {
            Text(title)
            Spacer()
            Image(systemName: isSelected ? "largecircle.fill.circle" : "circle")
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
