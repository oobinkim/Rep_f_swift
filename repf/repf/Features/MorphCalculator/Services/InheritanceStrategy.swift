//
//  InheritanceStrategy.swift
//  repf
//
//  Created by oobin on 9/26/24.
//

import Foundation

// 상속전략 계산 프로토콜
protocol InheritanceStrategy {
    func calculate(parent1: Morph, parent2: Morph) -> [String: Double]
}
