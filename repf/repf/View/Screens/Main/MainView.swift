//
//  MainView.swift
//  repf
//
//  Created by oobin on 12/19/24.
//

import SwiftUI
import FirebaseAuth

struct MainView: View {
    @State private var selectedButton: String? = nil
    @State private var selectedTab: Tab = .home
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 0) {
                // MARK: - 날짜 선택 영역
                HStack {
                    Button(action: {
                        print("이전 날짜 선택")
                    }) {
                        Image(systemName: "chevron.left")
                            .foregroundColor(.white)
                            .padding()
                    }
                    
                    Spacer()
                    
                    HStack(spacing: 4) {
                        Image(systemName: "calendar")
                            .foregroundColor(.white)
                        Text("오늘")
                            .foregroundColor(.white)
                    }
                    
                    Spacer()
                    
                    Button(action: {
                        print("다음 날짜 선택")
                    }) {
                        Image(systemName: "chevron.right")
                            .foregroundColor(.white)
                            .padding()
                    }
                }
                .padding(.top, 32)
                .frame(maxWidth: UIScreen.main.bounds.width * 0.98)
                
                // MARK: - ScrollView
                ScrollView(showsIndicators: false) {
                    VStack(spacing: 18) {
                        // 개체 등록 버튼
                        Button(action: {
                            print("개체 추가버튼")
                        }) {
                            VStack(spacing: 18) {
                                Image(systemName: "plus.circle")
                                    .resizable()
                                    .scaledToFit()
                                    .frame(width: 40, height: 40)
                                    .foregroundColor(.appWhite)
                                
                                Text("개체를 먼저 등록해주세요")
                                    .font(.system(size: 16))
                                    .foregroundColor(.appWhite)
                            }
                            .padding()
                            .frame(width: UIScreen.main.bounds.width * 0.9, height: 172) // 너비 수정
                            .background(Color.textBlack)
                            .cornerRadius(12)
                        }
                        
                        // 버튼 그리드
                        LazyVGrid(
                            columns: [
                                GridItem(.flexible(), spacing: 18),
                                GridItem(.flexible(), spacing: 18)
                            ],
                            spacing: 18
                        ) {
                            GridButton(
                                iconName: "water-drop-icon",
                                selectedIconName: "water-drop-selected",
                                title: "물 줬어요",
                                isSelected: selectedButton == "물 줬어요",
                                isSelectable: false
                            ) {
                                selectedButton = "물 줬어요"
                                print("물 줬어요 선택")
                            }
                            
                            GridButton(
                                iconName: "food-icon",
                                selectedIconName: "food-selected",
                                title: "먹이 줬어요",
                                isSelected: selectedButton == "먹이 줬어요",
                                isSelectable: false
                            ) {
                                selectedButton = "먹이 줬어요"
                                print("먹이 줬어요 선택")
                            }
                            
                            GridButton(
                                iconName: "molt-icon",
                                selectedIconName: "molt-selected",
                                title: "메이팅 했어요",
                                isSelected: selectedButton == "메이팅 했어요",
                                isSelectable: false
                            ) {
                                selectedButton = "메이팅 했어요"
                                print("메이팅 했어요 선택")
                            }
                            
                            GridButton(
                                iconName: "mating-icon",
                                selectedIconName: "mating-selected",
                                title: "탈피 했어요",
                                isSelected: selectedButton == "탈피 했어요",
                                isSelectable: false
                            ) {
                                selectedButton = "탈피 했어요"
                                print("탈피 했어요 선택")
                            }
                            GridButton(
                                iconName: "mating-icon",
                                selectedIconName: "mating-selected",
                                title: "배변 했어요",
                                isSelected: selectedButton == "배변 했어요",
                                isSelectable: false
                            ) {
                                selectedButton = "배변 했어요"
                                print("배변 했어요 선택")
                            }
                        }
                        .padding(.horizontal, 16)
                    }
                    .padding(.top, 20)
                }
                
                // MARK: - 하단바
                CustomTabBar(selectedTab: $selectedTab)
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .background(Color.bgBlack.edgesIgnoringSafeArea(.all))
            .foregroundColor(.appWhite)
        }
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
