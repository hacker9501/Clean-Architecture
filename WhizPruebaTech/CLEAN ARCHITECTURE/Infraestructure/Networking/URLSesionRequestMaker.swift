//
//  URLSesionRequestMaker.swift
//  PruebaTecnicaWhiz
//
//  Created by Elver Mayta Hernández on 17/04/24.
//

import Foundation

class URLSesionRequestMaker{
    func url(endPoint: Endpoint, baseURL: String) -> URL? {
        var urlComponents = URLComponents(string: baseURL + endPoint.path)
        let urlQueryParametrs = endPoint.queryParameters.map{
            URLQueryItem(name: $0.key, value: "\($0.value)")
        }
        urlComponents?.queryItems = urlQueryParametrs
        return urlComponents?.url
    }
}
