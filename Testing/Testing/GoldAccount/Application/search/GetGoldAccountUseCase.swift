//
//  GetGoldAccountUseCase.swift
//  Testing
//
//  Created by Javier Hernandez Sansalvador on 10/7/24.
//

import Foundation

final class GetGoldAccountUseCase {
    private let repository: GoldAccountRepository
    
    init(repository: GoldAccountRepository) {
        self.repository = repository
    }
    
    func invoke(
        request: GetGoldAccountRequest,
        completion: @escaping (Result<GetGoldAccountResponse, Error>) -> Void
    ) {
        repository.read(iban: request.iban) { result in
            switch result {
            case .success(let goldAccount):
                let response = GetGoldAccountResponse(
                    iban: goldAccount.iban,
                    idUser: goldAccount.idUser,
                    amount: goldAccount.amount
                )
                completion(.success(response))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
