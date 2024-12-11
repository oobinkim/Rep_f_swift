//
//  MorphCalculatorView.swift
//  repf
//
//  Created by oobin on 9/26/24.
//

import SwiftUI

struct MorphCalculatorView: View {
    @ObservedObject var viewModel = MorphCalculatorViewModel()
    
    var body: some View {
        VStack {
            Text("레오파드게코 모프 계산기")
                .font(.largeTitle)
                .padding()
            
            // 부모 1 모프 선택
            TextField("부모 1 모프 검색", text: $viewModel.searchText)
                .padding()
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            List(viewModel.filteredMorphs, id: \.name) { morph in
                Text(morph.name)
                    .onTapGesture {
                        viewModel.selectParent1(morph: morph)
                    }
            }
            
            if let selectedParent1 = viewModel.selectedParent1 {
                Text("선택된 부모 1 모프: \(selectedParent1.name)")
                    .padding()
            }
            
            // 부모 2 모프 선택
            TextField("부모 2 모프 검색", text: $viewModel.searchText)
                .padding()
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            List(viewModel.filteredMorphs, id: \.name) { morph in
                Text(morph.name)
                    .onTapGesture {
                        viewModel.selectParent2(morph: morph)
                    }
            }
            
            if let selectedParent2 = viewModel.selectedParent2 {
                Text("선택된 부모 2 모프: \(selectedParent2.name)")
                    .padding()
            }
            
            Button("확률 계산하기") {
                viewModel.calculateProbability()
            }
            .padding()
            
            if !viewModel.result.isEmpty {
                Text("예상 자손 모프 확률")
                    .font(.headline)
                    .padding()
                
                ForEach(viewModel.result.sorted(by: { $0.value > $1.value }), id: \.key) { morph, probability in
                    Text("\(morph): \(probability * 100, specifier: "%.1f")%")
                }
            }
        }
    }
}

struct MorphCalculatorView_Previews: PreviewProvider {
    static var previews: some View {
        MorphCalculatorView()
    }
}
