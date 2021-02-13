//
//  AccountViewModel.swift
//  ifengus_v20
//
//  Created by Alan Yang on 1/25/21.
//

import SwiftUI
import CoreData

class AccountViewModel: ObservableObject {
    @Published var isFlag: Bool = false
    @Published var username: String = ""
    init() {

    }
    
}
