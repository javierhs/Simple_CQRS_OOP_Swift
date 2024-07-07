//
//  CQRSRegistry.swift
//  Testing
//
//  Created by Javier Hernandez Sansalvador on 7/7/24.
//

import Foundation

final class AppSetup {
    private let queryBus: QueryBus
    private let commandBus: CommandBus
    
    init(queryBus: QueryBus, commandBus: CommandBus) {
        self.queryBus = queryBus
        self.commandBus = commandBus
        setup()
    }
    
    func setup() {
        UserModuleInitializer().setup(commandBus: commandBus, queryBus: queryBus)
    }
}
