//
//  GetUserQueryHandler.swift
//  Testing
//
//  Created by Javier Hernandez Sansalvador on 7/7/24.
//

import Foundation

class GetUserQueryHandler: QueryHandler {
    typealias QueryType = GetUserQuery
    typealias ResultType = GetUserResponse
    
    private let repository: UserRepository
    
    init(repository: UserRepository) {
        self.repository = repository
    }

    func handle(query: GetUserQuery, completion: @escaping (Result<GetUserResponse, Error>) -> Void) {
        let request = GetUserRequest(id: query.userId)
        GetUserUseCase(repository: repository).invoke(request: request) { result in
                completion(result)
        }
    }
}
