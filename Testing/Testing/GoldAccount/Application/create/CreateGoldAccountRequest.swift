//
//  CreateGoldAccountRequest.swift
//  Testing
//
//  Created by Javier Hernandez Sansalvador on 10/7/24.
//

import Foundation

final class CreateGoldAccountRequest {
    let iban: String
    let idUser: String
    let amount: UInt
    
    init(iban: String, idUser: String, amount: UInt) {
        self.iban = iban
        self.idUser = idUser
        self.amount = amount
    }
}
