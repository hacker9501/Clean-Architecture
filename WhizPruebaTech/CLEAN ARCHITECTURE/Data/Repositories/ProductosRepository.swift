//
//  ProductosRepository.swift
//  PruebaTecnicaWhiz
//
//  Created by Elver Mayta Hernández on 16/04/24.
//

import Foundation

//implementa el protocol del dominio
class ProductosRepository : ProductoListRepositoryProtocol {
    
    //se utiliza el patron datasource -> dependencia
    private let apiDataSource: ApiDataSourceProtocol
    private let errorMapper: ProductoDomainMapeer
    
    init(apiDataSource: ApiDataSourceProtocol,errorMapper: ProductoDomainMapeer) {
        self.apiDataSource = apiDataSource
        self.errorMapper = errorMapper
    }
    
    func getProductosList() async -> Result<ProductEntity, ProductDomainError> {
    
        let productoList = await apiDataSource.getProductListData()
        print("repositori data func", productoList)
        guard case .success(let producto) = productoList else {
            return .failure(errorMapper.map(error: (productoList.failreValue as? HTTPClienteError)!))
        }

        return .success(producto)
        
    }
    
}
