//
//  DetailView.swift
//  PruebaTecnicaWhiz
//
//  Created by Elver Mayta Hernández on 17/04/24.
//

import SwiftUI

struct DetailProdView: View {
    var product : ProductoListPresentable
    
    var body: some View {
        VStack{
            CardDetailProdView(product: product)
            Spacer()
        }
        .navigationTitle("Detalle del Producto")
    }
}

//#Preview {
//    DetailView()
//}
