//
//  ProductoListFactory.swift
//  PruebaTecnicaWhiz
//
//  Created by Elver Mayta Hernández on 17/04/24.
//

import Foundation

class ProductoListFactory {
    
    static func createHome() -> HomeView {
        return HomeView()
    }
    
    static func create() -> ProductosListView {
        return ProductosListView(viewModel: createViewModel())
    }
    
    private static func createViewModel() -> ProductoListViewModel {
        return ProductoListViewModel(getProductoList: createUseCase())
    }
    
    private static func createUseCase() -> ProductoListProtocol {
        return ProductosList(repository: createRepository())
    }
    
    private static func createRepository() -> ProductoListRepositoryProtocol {
        return ProductosRepository(apiDataSource: createDataSource(), errorMapper: ProductoDomainMapeer())
    }
    
    private static func createDataSource() -> ApiDataSourceProtocol {
        let httpCliente = URLSesionHTTClient(urlSesionRequestMaker: URLSesionRequestMaker(), errorResolver: URLSesionErrorResolver())
        return ApiProductDataSource(httCliente: httpCliente)
    }
}
