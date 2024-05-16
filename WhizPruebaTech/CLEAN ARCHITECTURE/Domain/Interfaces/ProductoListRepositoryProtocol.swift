//
//  ProductoListRepositoryProtocol.swift
//  PruebaTecnicaWhiz
//
//  Created by Elver Mayta Hernández on 16/04/24.
//

import Foundation
//la clase que implemente este protocolo detalles de data para que se comunique la data con el dominio
//principio de la inversion de la dependencia -> con un patron repository
protocol ProductoListRepositoryProtocol {
    func getProductosList() async -> Result<ProductEntity,ProductDomainError>
}
