//
//  GoldAccountError.swift
//  Testing
//
//  Created by Javier Hernandez Sansalvador on 10/7/24.
//

import Foundation

enum GoldAccountError: Error {
    case goldAccountNotFound
    case goldAccountCannotBeCreated
    case goldAccountCannotBeCreatedBecauseUserAgeUnder60
}
