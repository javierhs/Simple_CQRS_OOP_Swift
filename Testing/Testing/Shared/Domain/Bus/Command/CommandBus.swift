//
//  CommandBus.swift
//  Testing
//
//  Created by Javier Hernandez Sansalvador on 7/7/24.
//

import Foundation

protocol CommandBus {
    func register<C: Command, H: CommandHandler>(_ handler: H) where H.CommandType == C
    func dispatch<C: Command>(_ command: C, completion: @escaping (Result<Void, Error>) -> Void)
}
