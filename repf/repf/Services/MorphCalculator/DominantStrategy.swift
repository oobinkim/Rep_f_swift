//
//  DominantStrategy.swift
//  repf
//
//  Created by oobin on 9/26/24.
//

import Foundation
// 우성
class DominantStrategy: InheritanceStrategy {
    func calculate(parent1: Morph, parent2: Morph) -> [String: Double] {
        return [
            "Het \(parent2.name)": 0.50, // 50%는 열성 유전자를 가진 헷 모프
            parent1.name: 0.50         // 나머지 50%는 우성
        ]
    }
}
