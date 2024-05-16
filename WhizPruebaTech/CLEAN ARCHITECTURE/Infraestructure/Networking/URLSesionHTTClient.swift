//
//  URLSesionHTTClient.swift
//  PruebaTecnicaWhiz
//
//  Created by Elver Mayta Hernández on 17/04/24.
//

import Foundation

//implementa el protocolo que se encuentra en la capa data
class URLSesionHTTClient : HTTCliente {
    let sesion: URLSession
    let urlSesionRequestMaker : URLSesionRequestMaker
    let errorResolver : URLSesionErrorResolver
    
    init(sesion: URLSession = .shared, urlSesionRequestMaker: URLSesionRequestMaker, errorResolver: URLSesionErrorResolver) {
        self.sesion = sesion
        self.urlSesionRequestMaker = urlSesionRequestMaker
        self.errorResolver = errorResolver
    }
    
    func makeRequest(endPoint: Endpoint, baseURL: String) async -> Result<Data, HTTPClienteError> {
        guard let url = urlSesionRequestMaker.url(endPoint: endPoint, baseURL: baseURL) else {
            return .failure(.baseUrl)
        }
        
        do{
            let result = try await sesion.data(from: url)
            guard let response = result.1 as? HTTPURLResponse else {
                return .failure(.responseError)
            }
            guard response.statusCode == 200 else {
                return .failure(errorResolver.resolver(statusCode: response.statusCode))
            }
            print("datos de productos infraestruture", response)
            return .success(result.0)
            
        }catch {
            return .failure(errorResolver.resolve(error: error))
        }
    }
    
}
