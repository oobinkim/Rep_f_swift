//
//  MainSpeciesView.swift
//  repf
//
//  Created by oobin on 12/18/24.
//

import SwiftUI

struct MainSpeciesView: View {
    
    @ObservedObject var viewModel: ProfileViewModel
    @State private var selectedSpecies: String? = nil
    
    var body: some View {
        VStack {
            // 타이틀
            VStack(spacing: 8) {
                Text("주로 브리딩하는 종이 있나요?")
                    .font(.custom("Pretendard-Medium", size: 24))
                    .fontWeight(.semibold)
                    .foregroundColor(.appWhite)
                    .frame(maxWidth: .infinity,alignment: .leading)
                    .padding(.top, 32)
                    .padding(.bottom, 32)
            }
            .padding(.bottom, 16)

            VStack(alignment: .leading, spacing: 12) {
                       HStack(spacing: 8) {
                           ForEach(viewModel.species.speciesList.prefix(3), id: \.self) { species in
                               SpeciesButton(
                                   title: species,
                                   isSelected: selectedSpecies == species
                               ) {
                                   selectedSpecies = species
                               }
                           }
                       }
                       
                       HStack(spacing: 8) {
                           ForEach(viewModel.species.speciesList[3..<6], id: \.self) { species in
                               SpeciesButton(
                                   title: species,
                                   isSelected: selectedSpecies == species
                               ) {
                                   selectedSpecies = species
                               }
                           }
                       }
                       
                       HStack(spacing: 8) {
                           ForEach(viewModel.species.speciesList[6..<9], id: \.self) { species in
                               SpeciesButton(
                                   title: species,
                                   isSelected: selectedSpecies == species
                               ) {
                                   selectedSpecies = species
                               }
                           }
                       }
                       
                       HStack(spacing: 8) {
                           ForEach(viewModel.species.speciesList[9..<13], id: \.self) { species in
                               SpeciesButton(
                                   title: species,
                                   isSelected: selectedSpecies == species
                               ) {
                                   selectedSpecies = species
                               }
                           }
                       }
                       
                       HStack(spacing: 8) {
                           ForEach(viewModel.species.speciesList[13..<17], id: \.self) { species in
                               SpeciesButton(
                                   title: species,
                                   isSelected: selectedSpecies == species
                               ) {
                                   selectedSpecies = species
                               }
                           }
                       }
                       .padding(.bottom, 16)
                       
                       // "아직 없어요" 버튼
                       HStack {
                           SpeciesButton(
                               title: "아직 없어요",
                               isSelected: selectedSpecies == "none"
                           ) {
                               selectedSpecies = "none"
                           }
                           Spacer() // 왼쪽 정렬
                       }
                       .padding(.top, 8)
                   }

            Spacer()
            
            PrimaryButton(
                title: "다음",
                isEnabled: selectedSpecies != nil && !selectedSpecies!.isEmpty,
                action: {
                        viewModel.goToNextStep()
                },
                enabledColor: .Primary,
                disabledColor: .primaryDisabled,
                textColor: .textBlack
            )
            .padding(.bottom, 40)
        }
        .navigationBarBackButtonHidden(true)
        .frame(maxWidth: UIScreen.main.bounds.width * 0.98)
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Button(action: {
                    //TODO: skip 추가
                }) {
                    Text("건너뛰기")
                        .foregroundColor(.placeHolder)
                }
            }
            ToolbarItem(placement: .navigationBarLeading) {
                CustomBackButton(action: {
                    viewModel.goToPreviousStep()
                })
            }
        }
    }
}

struct MainSpeciesView_Previews: PreviewProvider {
    static var previews: some View {
        MainSpeciesView(viewModel: ProfileViewModel())
    }
}
