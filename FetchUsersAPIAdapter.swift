//
//  FetchUsersAPIAdapter.swift
//  AdoptingTDD
//
//  Created by VenD-Omeir on 12/09/2021.
//

import Foundation
class FetchUsersAPIAdapter: UserViewModelProtocol {
    
    let select: (User) -> ()
    let api: APIManagerProtocol
    
    init(api: APIManagerProtocol, select: @escaping (User) -> ()) {
        self.api = api
        self.select = select
    }
    
    func loadUsers(completion: @escaping ([UserViewModel]) -> Void) {
        api.loadUsers { (users) in
            let itemViewModels = users.map { (user) in
                return UserViewModel(user: user) { [weak self] in
                    self?.select(user)
                }
            }
            completion(itemViewModels)
        }
    }
    
    
}
