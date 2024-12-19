//
//  RegistrationViewModel+SaveUserInfo.swift
//  repf
//
//  Created by oobin on 12/17/24.
//

import FirebaseAuth
import FirebaseFirestore

extension RegistrationViewModel {
    func saveUserInfo(completion: @escaping (Bool) -> Void) {
        guard let uid = Auth.auth().currentUser?.uid else {
            errorMessage = "사용자 인증 정보가 없습니다."
            completion(false)
            return
        }

        let userData: [String: Any] = [
            "uid": uid,
            "name": user.name,
            "birth": user.birth,
            "gender": numberToGender(),
            "phoneNumber": user.phoneNumber,
            "carrier": user.carrier,
            "createdAt": Timestamp(date: Date())
        ]

        FirebaseService.shared.saveData(
            collection: "users",
            documentID: uid,
            data: userData,
            merge: true // 기존 데이터를 유지하며 병합
        ) { [weak self] success, error in
            guard let self = self else { return }

            DispatchQueue.main.async {
                if success {
                    print("Firestore에 사용자 정보 저장 완료")
                    self.errorMessage = nil
                    completion(true)
                } else {
                    print("Firestore 저장 실패: \(error ?? "알 수 없는 오류")")
                    self.errorMessage = "프로필 저장 실패: \(error ?? "알 수 없는 오류")"
                    completion(false)
                }
            }
        }
    }
}
