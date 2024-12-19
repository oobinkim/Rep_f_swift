//
//  SplashViewModel.swift
//  repf
//
//  Created by oobin on 12/19/24.
//
import FirebaseAuth
import SwiftUI

class SplashViewModel: ObservableObject {
    // MARK: - Published 상태 관리
    @Published var navigateToMain = false
    @Published var showButtons = false
    @Published var isButtonEnabled = false

    // MARK: - 자동 로그인 처리
    func handleAutoLogin() {
        if let user = Auth.auth().currentUser {
            print("자동 로그인 성공: \(user.email ?? "Unknown User")")
            DispatchQueue.main.async {
                self.navigateToMain = true
            }
        } else {
            print("자동 로그인 실패: 사용자 정보 없음")
            DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                self.isButtonEnabled = true
                withAnimation(.easeIn(duration: 0.5)) {
                    self.showButtons = true
                }
            }
        }
    }
}
