//
//  MorphCalculatorViewModel.swift
//  repf
//
//  Created by oobin on 9/26/24.
//

import Foundation
import Combine

class MorphCalculatorViewModel: ObservableObject {
    @Published var morphs: [Morph] = []
    @Published var searchText: String = ""
    @Published var selectedParent1: Morph?
    @Published var selectedParent2: Morph?
    @Published var result: [String: Double] = [:]
    
    private var morphCalculator = MorphCalculator()
    
    init() {
        morphs = MorphManager.shared.getMorphs()
    }
    
    var filteredMorphs: [Morph] {
        if searchText.isEmpty {
            return morphs
        } else {
            return morphs.filter { $0.name.localizedCaseInsensitiveContains(searchText) }
        }
    }
    
    func selectParent1(morph: Morph) {
        selectedParent1 = morph
        searchText = ""
    }
    
    func selectParent2(morph: Morph) {
        selectedParent2 = morph
        searchText = ""
    }
    
    func calculateProbability() {
        if let parent1 = selectedParent1, let parent2 = selectedParent2 {
            result = morphCalculator.calculateProbability(parent1: parent1, parent2: parent2)
        }
    }
}
