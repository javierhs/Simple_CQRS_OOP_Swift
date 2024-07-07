//
//  QueryHandler.swift
//  Testing
//
//  Created by Javier Hernandez Sansalvador on 7/7/24.
//

import Foundation


protocol QueryHandler {
    associatedtype QueryType: Query
    associatedtype ResultType

    func handle(query: QueryType, completion: @escaping (Result<ResultType, Error>) -> Void)
}

//Type-erasure: Esta mierda de clase se hace porque no se puede guardar en una colección valores
//de tipos que conforman un protocolo que tiene tipos asociados.
//
//Para poder guardarlos, se hace esta clase "intermedia", a través de la cual podemos guardar
//distintas implementaciones del protocolo con tipos asociados.
class AnyQueryHandlerBox {
    private let _handle: (Any, @escaping (Any) -> Void) -> Void

    init<Q: Query, R, H: QueryHandler>(_ handler: H) where H.QueryType == Q, H.ResultType == R {
        _handle = { query, completion in
            if let query = query as? Q {
                handler.handle(query: query) { result in
                    completion(result as Any)
                }
            }
        }
    }

    func handle(query: Any, completion: @escaping (Any) -> Void) {
        _handle(query, completion)
    }
}


