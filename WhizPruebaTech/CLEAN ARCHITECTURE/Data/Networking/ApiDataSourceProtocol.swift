//
//  ApiDataSourceProtocol.swift
//  PruebaTecnicaWhiz
//
//  Created by Elver Mayta Hernández on 16/04/24.
//

import Foundation

protocol ApiDataSourceProtocol {
    //mas metodos para obtener lo que queramos
    func getProductListData() async -> Result<ProductEntity,HTTPClienteError>
}
