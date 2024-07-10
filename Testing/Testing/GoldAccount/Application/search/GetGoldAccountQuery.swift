//
//  GetGoldAccountQuery.swift
//  Testing
//
//  Created by Javier Hernandez Sansalvador on 10/7/24.
//

import Foundation

final class GetGoldAccountQuery: Query {
    let iban: String
    
    init(iban: String) {
        self.iban = iban
    }
}
