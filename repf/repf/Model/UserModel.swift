//
//  UserModel.swift
//  repf
//
//  Created by oobin on 12/14/24.
//

import Foundation

class UserModel: ObservableObject {
    @Published var name: String = ""
    @Published var birth: String = ""
    @Published var phoneNumber: String = ""
    @Published var gender: String = ""
    @Published var carrier: String = ""
}
