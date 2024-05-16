//
//  ProductosList.swift
//  PruebaTecnicaWhiz
//
//  Created by Elver Mayta Hernández on 16/04/24.
//

import Foundation

protocol ProductoListProtocol {
    func execute() async -> Result<ProductEntity,ProductDomainError>
}

class ProductosList: ProductoListProtocol {
    //va a tener una dependencia del protocol
    private let repository : ProductoListRepositoryProtocol
    
    //luego lo inyectamos -> inyeccion de dependencias
    init(repository: ProductoListRepositoryProtocol) {
        self.repository = repository
    }
    
    func execute() async -> Result<ProductEntity,ProductDomainError> {
        let result = await repository.getProductosList()
        print("mostrar data segun la llamada",result)
        guard let productList = try? result.get() else {
            guard case .failure(let error) = result else {
                return .failure(.generic)
            }
            
            return .failure(error)

        }
        return .success(productList)
    }
    
}

