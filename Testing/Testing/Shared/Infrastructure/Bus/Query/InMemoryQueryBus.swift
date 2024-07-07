//
//  InMemoryQueryBus.swift
//  Testing
//
//  Created by Javier Hernandez Sansalvador on 7/7/24.
//

import Foundation

final class InMemoryQueryBus: QueryBus {
    private var handlers = [String: AnyQueryHandlerBox]()
    
    func register<Q: Query, R, H: QueryHandler>(_ handler: H) where H.QueryType == Q, H.ResultType == R {
        let key = String(describing: Q.self)
        handlers[key] = AnyQueryHandlerBox(handler)
    }
    
    func dispatch<Q: Query, R>(_ query: Q, completion: @escaping (Result<R, Error>) -> Void) {
        let key = String(describing: Q.self)
        guard let handlerBox = handlers[key] else {
            fatalError("No handler registered for query: \(key)")
        }
        handlerBox.handle(query: query) { result in
            if let result = result as? Result<R, Error> {
                completion(result)
            } else {
                fatalError("Unexpected result type for query: \(key)")
            }
        }
    }
}
