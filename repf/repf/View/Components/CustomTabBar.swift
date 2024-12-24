//
//  CustomTabBar.swift
//  repf
//
//  Created by oobin on 12/19/24.
//

import SwiftUI

enum Tab {
    case home, explore, shop, profile
}

struct CustomTabBar: View {
    @Binding var selectedTab: Tab // 현재 선택된 탭 상태

    var body: some View {
        VStack {
            HStack(alignment: .center) {
                TabBarButton(icon: "house.fill", title: "홈", tab: .home, selectedTab: $selectedTab)
                Spacer()
                TabBarButton(icon: "person.3.fill", title: "분양", tab: .explore, selectedTab: $selectedTab)
                Spacer()
                TabBarButton(icon: "location.fill", title: "샵 찾기", tab: .shop, selectedTab: $selectedTab)
                Spacer()
                TabBarButton(icon: "person.crop.circle", title: "마이", tab: .profile, selectedTab: $selectedTab)
            }
            .padding(.vertical, 10)
            .padding(.horizontal, 20)
            .frame(height: UIScreen.main.bounds.height * 0.1)
            .background(Color.bgBlack.edgesIgnoringSafeArea(.all)) // 배경 색상
            .overlay(
                Rectangle()
                    .frame(height: 1)
                    .foregroundColor(.gray.opacity(0.5)),
                alignment: .top
            )
        }
    }
}

// MARK: - 하단바 버튼
struct TabBarButton: View {
    let icon: String
    let title: String
    let tab: Tab
    @Binding var selectedTab: Tab

    var body: some View {
        Button(action: {
            selectedTab = tab
        }) {
            VStack(spacing: 6) {
                Image(systemName: icon)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 28, height: 28)
                    .foregroundColor(selectedTab == tab ? .Primary : .appWhite)
                
                Text(title)
                    .font(.system(size: 12))
                    .foregroundColor(selectedTab == tab ? .Primary : .appWhite)
            }
        }
    }
}

// MARK: - 미리보기
struct CustomTabBar_Previews: PreviewProvider {
    static var previews: some View {
        CustomTabBar(selectedTab: .constant(.home))
    }
}
