//
//  ApiProductDataSource.swift
//  PruebaTecnicaWhiz
//
//  Created by Elver Mayta Hernández on 16/04/24.
//

import Foundation

class ApiProductDataSource: ApiDataSourceProtocol {
    
    let httCliente : HTTCliente
    
    init(httCliente: HTTCliente) {
        self.httCliente = httCliente
    }
    
    func getProductListData() async -> Result<ProductEntity, HTTPClienteError> {
        
        let endPoint = Endpoint(path: "sapp/productos/plp/1/ad2fdd4bbaec4d15aa610a884f02c91a8", queryParameters: [:], method: .get)
        
        let result = await httCliente.makeRequest(endPoint: endPoint, baseURL: "http://alb-dev-ekt-875108740.us-east-1.elb.amazonaws.com/")
        
        print("url de data quiero saber la ruta:",result)
        
        guard case .success(let data) = result else {
            return .failure(handleError(error: result.failreValue as? HTTPClienteError))
        }
        if let json = String(data: data, encoding: .utf8) {
            print("datos recibidos:" , json)
        }else{
            print("error al obtener datos")
        }
        
        print("Data received from API:", data)
            
        guard let productos = try? JSONDecoder().decode(ProductEntity.self, from:data) else {
            return .failure(.parsingError)
        }
        print("lista de productos",productos)
        return .success(productos)
        
    }
    
    private func handleError(error:HTTPClienteError?) -> HTTPClienteError {
        guard let error = error else {
            return .generic
        }
        return error
    }
    
}

