//
//  Foundation+extensions.swift
//  PruebaTecnicaWhiz
//
//  Created by Elver Mayta Hernández on 16/04/24.
//

import Foundation

extension Result {
    var failreValue : Error? {
        switch self {
        case .failure(let error):
            return error
        case .success:
            return nil
        }
    }
}
