//
//  CreateAccountCommandHandler.swift
//  Testing
//
//  Created by Javier Hernandez Sansalvador on 10/7/24.
//

import Foundation

final class CreateGoldAccountCommandHandler: CommandHandler {
    typealias CommandType = CreateGoldAccountCommand
    
    private let repository: GoldAccountRepository
    private let queryBus: QueryBus
    
    init(
        repository: GoldAccountRepository,
        queryBus: QueryBus
    ) {
        self.repository = repository
        self.queryBus = queryBus
    }
    
    func handle(command: CreateGoldAccountCommand, completion: @escaping (Result<Void, Error>) -> Void) {
        let request = CreateGoldAccountRequest(
            iban: command.iban,
            idUser: command.idUser,
            amount: command.amount
        )
        CreateGoldAccountUseCase(repository: repository, queryBus: queryBus)
            .invoke(request: request) { result in
                completion(result)
            }
    }
}
