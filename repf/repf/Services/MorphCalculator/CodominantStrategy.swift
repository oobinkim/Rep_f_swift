//
//  CodominantStrategy.swift
//  repf
//
//  Created by oobin on 9/26/24.
//

import Foundation
// 공우성
class CodominantStrategy: InheritanceStrategy {
    func calculate(parent1: Morph, parent2: Morph) -> [String: Double] {
        return [
            "\(parent1.name)/\(parent2.name)": 0.50,
            "\(parent1.name)": 0.25,
            "\(parent2.name)": 0.25
        ]
    }
}
