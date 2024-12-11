//
//  SplashView.swift
//  repf
//
//  Created by oobin on 12/10/24.
//
import SwiftUI

struct SplashView: View {
    var body: some View {
        ZStack {
            // 배경 이미지
            Image("logo")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .edgesIgnoringSafeArea(.all)
        }
    }
}

struct SplashView_Previews: PreviewProvider {
    static var previews: some View {
        SplashView()
    }
}
