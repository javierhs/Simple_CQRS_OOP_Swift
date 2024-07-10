//
//  GoldAccountRepository.swift
//  Testing
//
//  Created by Javier Hernandez Sansalvador on 10/7/24.
//

import Foundation

protocol GoldAccountRepository {
    func create(goldAccount: GoldAccount, completion: (Result<Void, Error>) -> Void)
    func read(iban: String, completion: (Result<GoldAccount, Error>) -> Void)
}
