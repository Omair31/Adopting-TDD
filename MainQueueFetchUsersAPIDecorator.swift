//
//  MainQueueFetchUsersAPIDecorator.swift
//  AdoptingTDD
//
//  Created by VenD-Omeir on 12/09/2021.
//

import Foundation
class MainQueueFetchUsersAPIDecorator: APIManagerProtocol {
    
    let api: APIManagerProtocol
    
    init(api: APIManagerProtocol) {
        self.api = api
    }
    
    func loadUsers(completion: @escaping ([User]) -> Void) {
        api.loadUsers { (users) in
            if Thread.current.isMainThread {
                completion(users)
            } else {
                DispatchQueue.main.async {
                    completion(users)
                }
            }
        }
        
    }
    
}
