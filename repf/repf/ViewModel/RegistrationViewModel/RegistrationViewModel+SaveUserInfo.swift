//
//  RegistrationViewModel+SaveUserInfo.swift
//  repf
//
//  Created by oobin on 12/17/24.
//
import FirebaseAuth
import FirebaseFirestore

extension RegistrationViewModel{
    // MARK: - 유저 정보 DB저장
    func SaveUserInfo(completion: @escaping (Bool) -> Void) {
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

           db.collection("users").document(uid).setData(userData) { error in
               if let error = error {
                   print("Firestore 저장 실패: \(error.localizedDescription)")
                   self.errorMessage = "프로필 저장 실패"
                   completion(false)
               } else {
                   print("Firestore에 사용자 정보 저장 완료")
                   completion(true)
               }
           }
       }
    
}
