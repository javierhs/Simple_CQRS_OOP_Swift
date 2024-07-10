//
//  InMemoryCommandBus.swift
//  Testing
//
//  Created by Javier Hernandez Sansalvador on 7/7/24.
//

import Foundation

final class SyncCommandBus: CommandBus {
    private var handlers = [String: AnyCommandHandlerBox]()
    
    func register<C, H>(_ handler: H) where C == H.CommandType, H : CommandHandler {
        let key = String(describing: C.self)
        handlers[key] = AnyCommandHandlerBox(handler)
    }
    
    func dispatch<C>(_ command: C, completion: @escaping (Result<Void, Error>) -> Void) where C : Command  {
        let key = String(describing: C.self)
        guard let handlerBox = handlers[key] else {
            fatalError("No handler registered for query: \(key)")
        }
        handlerBox.handle(command: command) { result in
            if let result = result as? Result<Void, Error> {
                completion(result)
            } else {
                fatalError("Unexpected result type for query: \(key)")
            }
        }
    }
}
