//
//  ProfileViewModel+SaveProfile.swift
//  repf
//
//  Created by oobin on 12/19/24.
//

import FirebaseFirestore
import FirebaseAuth

extension ProfileViewModel {
    func saveProfile(completion: @escaping (Bool) -> Void) {
        guard let uid = Auth.auth().currentUser?.uid else {
            print("사용자 인증 정보가 없음.")
            completion(false)
            return
        }

        let profileData: [String: Any] = [
            "userType": profile.userType,
            "businessNumber": profile.businessNumber,
            "nickName": profile.nickName,
            "mainSpecies": profile.mainSpecies
        ]

        FirebaseService.shared.saveData(
            collection: "users",
            documentID: uid,
            data: profileData,
            merge: true 
        ) { success, error in
            if success {
                print("프로필 저장 성공")
                completion(true)
            } else {
                print("프로필 저장 실패: \(error ?? "알 수 없는 오류")")
                completion(false)
            }
        }
    }
}
