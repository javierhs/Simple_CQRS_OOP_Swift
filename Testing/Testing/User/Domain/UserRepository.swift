//
//  UserRepository.swift
//  Testing
//
//  Created by Javier Hernandez Sansalvador on 7/7/24.
//

import Foundation

protocol UserRepository {
    func create(user: User, completion: (Result<Void, Error>) -> Void)
    func read(id: String, completion: (Result<User, Error>) -> Void)
}
