//
//  CreateUserCommandHandler.swift
//  Testing
//
//  Created by Javier Hernandez Sansalvador on 7/7/24.
//

import Foundation

final class CreateUserCommandHandler: CommandHandler {
    typealias CommandType = CreateUserCommand
    
    private let repository: UserRepository
    
    init(repository: UserRepository) {
        self.repository = repository
    }
    
    func handle(command: CreateUserCommand, completion: @escaping (Result<Void, Error>) -> Void) {
        let request = CreateUserRequest(id: command.id, name: command.name)
        CreateUserUseCase(repository: repository)
            .invoke(request: request) { result in
                completion(result)
            }
    }
}
