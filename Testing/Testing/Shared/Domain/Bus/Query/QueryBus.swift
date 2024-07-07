//
//  QueryBus.swift
//  Testing
//
//  Created by Javier Hernandez Sansalvador on 7/7/24.
//

import Foundation

protocol QueryBus {
    func register<Q: Query, R, H: QueryHandler>(_ handler: H) where H.QueryType == Q, H.ResultType == R
    func dispatch<Q: Query, R>(_ query: Q, completion: @escaping (Result<R, Error>) -> Void)
}
