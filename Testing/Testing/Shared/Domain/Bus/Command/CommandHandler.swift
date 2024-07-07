//
//  CommandHandler.swift
//  Testing
//
//  Created by Javier Hernandez Sansalvador on 7/7/24.
//

import Foundation

protocol CommandHandler {
    associatedtype CommandType: Command

    func handle(command: CommandType, completion: @escaping (Result<Void, Error>) -> Void)
}

//Type-erasure: Esta mierda de clase se hace porque no se puede guardar en una colección valores
//de tipos que conforman un protocolo que tiene tipos asociados.
//
//Para poder guardarlos, se hace esta clase "intermedia", a través de la cual podemos guardar
//distintas implementaciones del protocolo con tipos asociados.
class AnyCommandHandlerBox {
    private let _handle: (Any, @escaping (Any) -> Void) -> Void

    init<C: Command, H: CommandHandler>(_ handler: H) where H.CommandType == C {
        _handle = { command, completion in
            if let command = command as? C {
                handler.handle(command: command) { result in
                    completion(result)
                }
            }
        }
    }

    func handle(command: Any, completion: @escaping (Any) -> Void) {
        _handle(command, completion)
    }
}
