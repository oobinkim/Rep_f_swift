//
//  ProfileModel.swift
//  repf
//
//  Created by oobin on 12/17/24.
//

import Foundation

class ProfileModel: ObservableObject {
    @Published var userType: String = ""
    @Published var businessNumber: String = ""
    @Published var nickName: String = ""
    @Published var mainSpecies: String = ""
}
