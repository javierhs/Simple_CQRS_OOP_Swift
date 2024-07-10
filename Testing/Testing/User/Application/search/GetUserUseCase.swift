//
//  GetUserUseCase.swift
//  Testing
//
//  Created by Javier Hernandez Sansalvador on 7/7/24.
//

import Foundation

final class GetUserUseCase {
    private let repository: UserRepository
    
    init(repository: UserRepository) {
        self.repository = repository
    }
    
    func invoke(
        request: GetUserRequest,
        completion: @escaping (Result<GetUserResponse, Error>) -> Void
    ) {
        repository.read(id: request.id) { result in
            switch result {
            case .success(let user):
                let response = GetUserResponse(id: user.id, name: user.name, age: user.age)
                completion(.success(response))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
}
