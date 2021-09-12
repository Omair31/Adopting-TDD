//
//  APIManagerProtocol.swift
//  AdoptingTDD
//
//  Created by VenD-Omeir on 12/09/2021.
//

import Foundation
protocol APIManagerProtocol {
    func loadUsers(completion: @escaping ([User]) -> Void)
}

protocol UserViewModelProtocol {
    func loadUsers(completion: @escaping ([UserViewModel]) -> Void)
}
