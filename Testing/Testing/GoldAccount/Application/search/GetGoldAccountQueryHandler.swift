//
//  GetGoldAccountQueryHandler.swift
//  Testing
//
//  Created by Javier Hernandez Sansalvador on 10/7/24.
//

import Foundation

class GetGoldAccountQueryHandler: QueryHandler {
    typealias QueryType = GetGoldAccountQuery
    typealias ResultType = GetGoldAccountResponse
    
    private let repository: GoldAccountRepository
    
    init(repository: GoldAccountRepository) {
        self.repository = repository
    }

    func handle(query: GetGoldAccountQuery, completion: @escaping (Result<GetGoldAccountResponse, Error>) -> Void) {
        let request = GetGoldAccountRequest(iban: query.iban)
        GetGoldAccountUseCase(repository: repository).invoke(request: request) { result in
                completion(result)
        }
    }
}
