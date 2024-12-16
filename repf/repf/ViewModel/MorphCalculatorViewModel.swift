//
//  MorphCalculatorViewModel.swift
//  repf
//
//  Created by oobin on 9/26/24.
//

import Foundation
import Combine

class MorphCalculatorViewModel: ObservableObject {
    
    @Published var morphs: [Morph] = [] // 모든 Morph 객체를 저장하는 배열
    @Published var searchText: String = "" // 검색 텍스트
    @Published var selectedParent1: Morph? // 첫 번째 부모 Morph
    @Published var selectedParent2: Morph? // 두 번째 부모 Morph
    @Published var result: [String: Double] = [:] // 결과
    
    private var morphCalculator = MorphCalculator() // Morph 확률 계산기
    
    // MARK: - Morph 데이터 초기화
    init() {
        morphs = MorphManager.shared.getMorphs()
    }
    
    // MARK: - 계산

    /// 검색 텍스트 -> 필터링된 Morph 배열 반환
    var filteredMorphs: [Morph] {
        if searchText.isEmpty {
            return morphs // 검색어가 비어있으면 전체 목록 반환
        } else {
            return morphs.filter { $0.name.localizedCaseInsensitiveContains(searchText) } // 검색어를 포함하는 Morph만 반환
        }
    }
    
    // MARK: - 첫 번째 부모 Morph 선택
    func selectParent1(morph: Morph) {
        selectedParent1 = morph
        searchText = "" // 선택 후 검색 텍스트 초기화
    }
    
    // MARK: - 두 번째 부모 Morph 선택
    func selectParent2(morph: Morph) {
        selectedParent2 = morph
        searchText = "" // 선택 후 검색 텍스트 초기화
    }
    
    // MARK: - 부모 Morph로 확률 계산
    func calculateProbability() {
        if let parent1 = selectedParent1, let parent2 = selectedParent2 {
            result = morphCalculator.calculateProbability(parent1: parent1, parent2: parent2) // 계산 결과 저장
        }
    }
}
