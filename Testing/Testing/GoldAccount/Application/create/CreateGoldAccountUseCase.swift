//
//  CreateGoldAccountUseCase.swift
//  Testing
//
//  Created by Javier Hernandez Sansalvador on 10/7/24.
//

import Foundation

final class CreateGoldAccountUseCase {
    private let repository: GoldAccountRepository
    private let queryBus: QueryBus
    
    init(
        repository: GoldAccountRepository,
        queryBus: QueryBus
    ) {
        self.repository = repository
        self.queryBus = queryBus
    }
    
    func invoke(request: CreateGoldAccountRequest, completion: @escaping (Result<Void, Error>) -> Void) {
        queryBus.dispatch(GetUserQuery(userId: request.idUser)) { [weak self] (result: Result<GetUserResponse, Error>) in
            switch result {
            case .success(let getUserResponse):
                if getUserResponse.age < 60 {
                    completion(.failure(GoldAccountError.goldAccountCannotBeCreatedBecauseUserAgeUnder60))
                } else {
                    let goldAccount = GoldAccount(
                        iban: request.iban,
                        idUser: request.idUser,
                        amount: request.amount
                    )
                    self?.repository.create(goldAccount: goldAccount, completion: completion)
                }
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
