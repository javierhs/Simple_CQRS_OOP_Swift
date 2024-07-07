//
//  UserModuleInitializer.swift
//  Testing
//
//  Created by Javier Hernandez Sansalvador on 7/7/24.
//

import Foundation

final class UserModuleInitializer: ModuleInitializer {
    private let repository: UserRepository = InMemoryUserRepository()
    
    func setup(
        commandBus: CommandBus,
        queryBus: QueryBus
    ) {
        registerCommandHandlers(in: commandBus)
        registerQueryHandlers(in: queryBus)
    }
    
    private func registerCommandHandlers(in commandBus: CommandBus) {
        commandBus.register(CreateUserCommandHandler(repository: repository))
    }
    
    private func registerQueryHandlers(in queryBus: QueryBus) {
        queryBus.register(GetUserQueryHandler(repository: repository))
    }
}
