//
//  RecessiveStrategy.swift
//  repf
//
//  Created by oobin on 9/26/24.
//

import Foundation
// 열성
class RecessiveStrategy: InheritanceStrategy {
    func calculate(parent1: Morph, parent2: Morph) -> [String: Double] {
        return [
            parent1.name: 0.25,
            "Het \(parent1.name)": 0.50,
            "Normal": 0.25
        ]
    }
}
