//
//  CreateUserCommand.swift
//  Testing
//
//  Created by Javier Hernandez Sansalvador on 7/7/24.
//

import Foundation

final class CreateUserCommand: Command {
    let id: String
    let name: String
    let age: UInt
    
    init(id: String, name: String, age: UInt) {
        self.id = id
        self.name = name
        self.age = age
    }
}
