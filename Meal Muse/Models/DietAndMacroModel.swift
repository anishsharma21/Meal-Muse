import Foundation

struct Question {
    var title: String
    var options: [String]
}

struct DietOption {
    var name: String
}

struct MacroOption {
    var name: String
}

struct UserPreferences {
    var selectedDiets: Set<String>
    var selectedMacros: Set<String>
}
