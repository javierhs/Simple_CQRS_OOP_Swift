//
//  GetUserQuery.swift
//  Testing
//
//  Created by Javier Hernandez Sansalvador on 7/7/24.
//

import Foundation

final class GetUserQuery: Query {
    let userId: String
    
    init(userId: String) {
        self.userId = userId
    }
}
