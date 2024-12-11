//
//  PolygenicStrategy.swift
//  repf
//
//  Created by oobin on 9/26/24.
//

import Foundation
// 다인자
class PolygenicStrategy: InheritanceStrategy {
    func calculate(parent1: Morph, parent2: Morph) -> [String: Double] {
        return [
            parent1.name: 0.5,
            parent2.name: 0.5
        ]
    }
}
