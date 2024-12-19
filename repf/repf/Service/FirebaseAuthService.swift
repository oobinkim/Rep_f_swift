//
//  FirebaseAuthService.swift
//  repf
//
//  Created by oobin on 12/19/24.
//

import FirebaseAuth

class FirebaseAuthService {
    static let shared = FirebaseAuthService() // 싱글턴 인스턴스

    private init() {}

    // MARK: - 인증번호발송
    func sendPhoneNumberVerification(
        phoneNumber: String,
        completion: @escaping (Result<String, Error>) -> Void
    ) {
        PhoneAuthProvider.provider().verifyPhoneNumber(phoneNumber, uiDelegate: nil) { verificationID, error in
            if let error = error {
                completion(.failure(error))
                return
            }

            guard let verificationID = verificationID else {
                completion(.failure(NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "인증 ID없음."])))
                return
            }

            completion(.success(verificationID))
        }
    }
    
    // MARK: - 인증번호검증
    func verifyCode(
        verificationID: String,
        verificationCode: String,
        completion: @escaping (Result<AuthDataResult, Error>) -> Void
    ) {
        let credential = PhoneAuthProvider.provider().credential(withVerificationID: verificationID, verificationCode: verificationCode)

        Auth.auth().signIn(with: credential) { authResult, error in
            if let error = error {
                completion(.failure(error))
                return
            }

            guard let authResult = authResult else {
                completion(.failure(NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "인증 결과가 없음."])))
                return
            }

            completion(.success(authResult))
        }
    }
}
