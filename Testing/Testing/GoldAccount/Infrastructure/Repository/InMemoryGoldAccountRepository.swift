//
//  InMemoryGoldAccountRepository.swift
//  Testing
//
//  Created by Javier Hernandez Sansalvador on 10/7/24.
//

import Foundation

final class InMemoryGoldAccountRepository: GoldAccountRepository {
    private var goldAccounts: [String: GoldAccount]
    
    init(goldAccounts: [String : GoldAccount] = [:]) {
        self.goldAccounts = goldAccounts
    }
    
    func read(iban: String, completion: (Result<GoldAccount, Error>) -> Void) {
        if let goldAccount = goldAccounts[iban] {
            completion(.success(goldAccount))
        } else {
            completion(.failure(GoldAccountError.goldAccountNotFound))
        }
    }
    
    func create(goldAccount: GoldAccount, completion: (Result<Void, Error>) -> Void) {
        if goldAccounts.keys.contains(goldAccount.iban) {
            completion(.failure(GoldAccountError.goldAccountCannotBeCreated))
        } else {
            goldAccounts[goldAccount.iban] = goldAccount
            completion(.success(()))
        }
    }
}
