//
//  MorphManager.swift
//  repf
//
//  Created by oobin on 9/26/24.
//

import Foundation

class MorphManager {
    static let shared = MorphManager()
    private var morphs: [Morph]
    
    private init() {
        // 데이터 init
        morphs = [
            Morph(name: "Normal", inheritanceType: .dominant),
            Morph(name: "Albino", inheritanceType: .recessive),
            Morph(name: "Snow", inheritanceType: .polygenic),
            Morph(name: "Tangerine", inheritanceType: .polygenic),
            // TODO: 모프 추가하기
        ]
    }
    
    func getMorphs() -> [Morph] {
        return morphs
    }
}
