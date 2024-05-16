//
//  HTTCliente.swift
//  PruebaTecnicaWhiz
//
//  Created by Elver Mayta Hernández on 17/04/24.
//

import Foundation

//la clse que implementa este protocol tiene que tener detalles de infraestructura
protocol HTTCliente {
    func makeRequest(endPoint: Endpoint, baseURL: String) async -> Result<Data, HTTPClienteError>
}
