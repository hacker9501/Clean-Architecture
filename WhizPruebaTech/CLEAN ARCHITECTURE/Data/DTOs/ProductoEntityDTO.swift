//
//  ProductoEntityDTO.swift
//  PruebaTecnicaWhiz
//
//  Created by Elver Mayta Hernández on 17/04/24.
//

import Foundation
//no se esta usando de momento
struct ProductoEntityDTO: Codable {
    let codigo: String
    let nombre: String
    let categoria: String
    let codigoCategoria: String
    let precioFinal: Double
    let urlImagenes: [String]
}
