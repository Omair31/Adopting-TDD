//
//  FetchUsersAPI.swift
//  AdoptingTDD
//
//  Created by VenD-Omeir on 12/09/2021.
//

import Foundation
class FetchUsersAPI: APIManagerProtocol {
    
    func loadUsers(completion: @escaping ([User]) -> Void) {
        let request = URLRequest(url: URL(string: "https://jsonplaceholder.typicode.com/users")!)
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            guard let jsonData = data else { return }
            do {
                let users = try JSONDecoder().decode([User].self, from: jsonData)
                print(users)
                completion(users)
            } catch let error {
                print(error)
                completion([])
            }
        }.resume()
    }
    
}
