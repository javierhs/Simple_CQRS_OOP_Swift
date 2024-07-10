//
//  CQRSRegistry.swift
//  Testing
//
//  Created by Javier Hernandez Sansalvador on 7/7/24.
//

import Foundation

final class AppSetup {
    private let queryBus: QueryBus = SyncQueryBus()
    private let commandBus: CommandBus = SyncCommandBus()
    private let userRepository = InMemoryUserRepository()
    private let goldAccountRepository = InMemoryGoldAccountRepository()
    
    init() {
        setup()
    }
    
    func setup() {
        //Setting up user module
        UserModuleInitializer(
            repository: userRepository,
            queryBus: queryBus,
            commandBus: commandBus
        ).setup()
        
        //Setting up gold account module
        GoldAccountModuleInitializer(
            repository: goldAccountRepository,
            queryBus: queryBus,
            commandBus: commandBus
        ).setup()
    }
    
    func commandBusInstance() -> CommandBus {
        commandBus
    }
    
    func queryBusInstance() -> QueryBus {
        queryBus
    }
}
