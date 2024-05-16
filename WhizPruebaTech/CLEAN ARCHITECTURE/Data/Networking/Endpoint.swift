//
//  Endpoint.swift
//  PruebaTecnicaWhiz
//
//  Created by Elver Mayta Hernández on 17/04/24.
//

import Foundation

struct Endpoint {
    let path : String
    let queryParameters : [String:Any]
    let method: HTTPMethod
}
