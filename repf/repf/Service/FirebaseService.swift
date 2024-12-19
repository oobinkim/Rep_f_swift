//
//  FirebaseService.swift
//  repf
//
//  Created by oobin on 12/19/24.
//

import FirebaseFirestore

class FirebaseService {
    static let shared = FirebaseService()
    private let db = Firestore.firestore()
    
    private init() {}

    func saveData(
        collection: String,
        documentID: String,
        data: [String: Any],
        merge: Bool = false, // merge 기본값: false
        completion: @escaping (Bool, String?) -> Void
    ) {
        db.collection(collection).document(documentID).setData(data, merge: merge) { error in
            if let error = error {
                completion(false, error.localizedDescription)
            } else {
                completion(true, nil)
            }
        }
    }
}
