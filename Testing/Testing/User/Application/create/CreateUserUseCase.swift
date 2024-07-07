//
//  CreateUserUseCase.swift
//  Testing
//
//  Created by Javier Hernandez Sansalvador on 7/7/24.
//

import Foundation

final class CreateUserUseCase {
    private let repository: UserRepository
    
    init(repository: UserRepository) {
        self.repository = repository
    }
    
    func invoke(request: CreateUserRequest, completion: (Result<Void, Error>) -> Void) {
        let user = User(id: request.id, name: request.name)
        repository.create(user: user, completion: completion)
    }
}
