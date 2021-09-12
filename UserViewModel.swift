//
//  UserViewModel.swift
//  AdoptingTDD
//
//  Created by VenD-Omeir on 12/09/2021.
//

import Foundation
struct UserViewModel {
    
    var id: String
    var name: String
    var body: String
    var select: () -> ()
    
    init(user: User, select: @escaping () -> ()) {
        id = "\(user.id)"
        name = user.name.capitalized
        body = user.email
        self.select = select
    }
}
