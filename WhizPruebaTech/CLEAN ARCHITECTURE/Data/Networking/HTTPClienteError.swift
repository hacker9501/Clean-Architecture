//
//  HTTPClienteError.swift
//  PruebaTecnicaWhiz
//
//  Created by Elver Mayta Hernández on 16/04/24.
//

import Foundation

enum HTTPClienteError : Error {
    case clientError
    case serverError
    case generic
    case parsingError
    case baseUrl
    case responseError
    case toodManyRequest
}
