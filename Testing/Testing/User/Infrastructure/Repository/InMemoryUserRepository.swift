//
//  InMemoryUserRepository.swift
//  Testing
//
//  Created by Javier Hernandez Sansalvador on 7/7/24.
//

import Foundation

final class InMemoryUserRepository: UserRepository {
    private var users: [String: User]
    
    init(users: [String : User] = [:]) {
        self.users = users
    }
    
    func read(id: String, completion: (Result<User, Error>) -> Void) {
        if let user = users[id] {
            completion(.success(user))
        } else {
            completion(.failure(UserError.userNotFound))
        }
    }
    
    func create(user: User, completion: (Result<Void, Error>) -> Void) {
        if users.keys.contains(user.id) {
            completion(.failure(UserError.userCannotBeCreated))
        } else {
            users[user.id] = user
            completion(.success(()))
        }
    }
}
