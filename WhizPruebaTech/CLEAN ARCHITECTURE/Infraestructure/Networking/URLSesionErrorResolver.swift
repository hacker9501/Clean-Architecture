//
//  URLSesionErrorResolver.swift
//  PruebaTecnicaWhiz
//
//  Created by Elver Mayta Hernández on 17/04/24.
//

import Foundation

class URLSesionErrorResolver {
    func resolver(statusCode: Int) -> HTTPClienteError {
        guard statusCode != 429 else {
            return .toodManyRequest
        }
        
        guard statusCode < 500 else {
            return .clientError
        }
        return .serverError
    }
    
    func resolve(error: Error) -> HTTPClienteError {
        return .generic
    }
}
