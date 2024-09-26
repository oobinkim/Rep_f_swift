//
//  MorphCalculator.swift
//  repf
//
//  Created by oobin on 9/26/24.
//

import Foundation

class MorphCalculator {
    private var strategy: InheritanceStrategy?
    
    func setStrategy(for inheritanceType: InheritanceType) {
        switch inheritanceType {
        case .dominant:
            strategy = DominantStrategy() // 우성
        case .recessive:
            strategy = RecessiveStrategy() // 열성
        case .polygenic:
            strategy = PolygenicStrategy()
        case .codominant:
            strategy = CodominantStrategy()
        }
    }
    
    func calculateProbability(parent1: Morph, parent2: Morph) -> [String: Double] {
        setStrategy(for: parent1.inheritanceType)
        return strategy?.calculate(parent1: parent1, parent2: parent2) ?? [:]
    }
}
