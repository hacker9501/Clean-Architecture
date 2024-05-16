//
//  Producto.swift
//  PruebaTecnicaWhiz
//
//  Created by Elver Mayta Hernández on 16/04/24.
//

import Foundation

// MARK: - Productos
struct ProductEntity: Codable {
    let codigo, mensaje, folio, advertencia: String
    let resultado: Resultados
}

// MARK: - Resultado
struct Resultados: Codable {
    let paginacion: Paginacions
    let categoria: String
    let productos: [Product]
}

// MARK: - Paginacion
struct Paginacions: Codable {
    let pagina, totalPaginas, totalRegistros, totalRegistrosPorPagina: Int
}

// MARK: - Producto
struct Product: Codable {
    let id: String
    let idLinea: Int
    let codigoCategoria: CodigoCategorias
    let idModalidad, relevancia: Int
    let lineaCredito: String
    let pagoSemanalPrincipal, plazoPrincipal: Int
    let disponibleCredito: Bool
    let abonosSemanales: [AbonosSemanales]
    let sku, nombre: String
    let urlImagenes: [String]
    let precioRegular: Int
    let precioFinal, porcentajeDescuento: Double
    let descuento: Bool
    let precioCredito, montoDescuento: Double
}

// MARK: - AbonosSemanale
struct AbonosSemanales: Codable {
    let plazo, montoAbono, montoDescuentoAbono, montoUltimoAbono: Int
    let montoFinalCredito, idPromocion, montoDescuentoElektra, montoDescuentoBanco: Int
    let precio, montoAbonoDigital: Int
}

enum CodigoCategorias: String, Codable {
    case c = "C"
    case ma = "MA"
    case tl = "TL"
}
