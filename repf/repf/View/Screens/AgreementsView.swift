//
//  AgreementsView.swift
//  repf
//
//  Created by oobin on 12/12/24.
//

import SwiftUI

struct AgreementView: View {
    var body: some View {
        ZStack {
            Color.white
                .ignoresSafeArea()
            Text("Agreement Screen")
                .font(.largeTitle)
                .foregroundColor(.black)
        }
    }
}

struct AgreementView_Previews: PreviewProvider {
    static var previews: some View {
        AgreementView()
    }
}
