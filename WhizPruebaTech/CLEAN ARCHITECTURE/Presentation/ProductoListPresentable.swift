//
//  ProductoListPresentable.swift
//  WhizPruebaTech
//
//  Created by Elver Mayta Hernández on 18/04/24.
//

import Foundation

struct ProductoListPresentable {
    let id: String
    let imagen: [String]
    let name : String
    let precio : String
    
    init(domainModel: Product) {
        self.id = domainModel.id
        self.imagen = domainModel.urlImagenes
        self.name = domainModel.nombre
        self.precio = "\(domainModel.precioFinal) $"
    }
}
