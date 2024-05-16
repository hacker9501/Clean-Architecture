//
//  ProductoListViewModel.swift
//  PruebaTecnicaWhiz
//
//  Created by Elver Mayta Hernández on 17/04/24.
//

import Foundation
//el viewmodel tiene que acceder al caso de uso para obtener los productos inyectando accedemos a ella
//esta capa esta dependiendo de una capa interna pero siempre accede a trabes de una interfaz
class ProductoListViewModel : ObservableObject {
    private let getProductoList : ProductoListProtocol
    @Published var product : [ProductoListPresentable] = []
    @Published var fechProducts: Bool = false
    
    init(getProductoList: ProductoListProtocol) {
        self.getProductoList = getProductoList
    }
    
    func onAppear() {
        Task {
            do {
                fechProducts = true
                let result = await getProductoList.execute()
                let productos = try result.get().resultado.productos.map { ProductoListPresentable(domainModel: $0) }
                print("view model", result)
                
                Task { @MainActor in
                    fechProducts = false
                    self.product = productos
                    print("productos en el view model", productos)
                }
            } catch {
                print("Error:", error)
                // Handle error if needed
            }
        }
        
    }
}
