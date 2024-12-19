//
//  Untitled.swift
//  repf
//
//  Created by oobin on 12/19/24.
//

import SwiftUI
import FirebaseAuth

struct MainView: View {
    var body: some View {
        NavigationStack {
            VStack{
                Text("메인")
            }
        }
        .frame(maxWidth: UIScreen.main.bounds.width * 0.98)
        .navigationBarBackButtonHidden(true)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                CustomBackButton(action: {
                    do {
                        try Auth.auth().signOut()
                        print("로그아웃 완료")
                    } catch let signOutError as NSError {
                        print("로그아웃 실패: \(signOutError.localizedDescription)")
                    }
                })
            }
        }
    }
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
