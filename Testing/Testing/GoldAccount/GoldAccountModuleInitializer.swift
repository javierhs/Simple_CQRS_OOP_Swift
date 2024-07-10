//
//  GoldAccountModuleInitializer.swift
//  Testing
//
//  Created by Javier Hernandez Sansalvador on 10/7/24.
//

import Foundation

final class GoldAccountModuleInitializer: ModuleInitializer {
    private let repository: GoldAccountRepository
    private let queryBus: QueryBus
    private let commandBus: CommandBus
    
    init(
        repository: GoldAccountRepository,
        queryBus: QueryBus,
        commandBus: CommandBus
    ) {
        self.repository = repository
        self.queryBus = queryBus
        self.commandBus = commandBus
    }
    
    func setup() {
        registerCommandHandlers()
        registerQueryHandlers()
    }
    
    private func registerCommandHandlers() {
        commandBus.register(
            CreateGoldAccountCommandHandler(repository: repository, queryBus: queryBus)
        )
    }
    
    private func registerQueryHandlers() {
        queryBus.register(GetGoldAccountQueryHandler(repository: repository))
    }
}
