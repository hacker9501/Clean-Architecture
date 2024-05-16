//
//  CardListView.swift
//  PruebaTecnicaWhiz
//
//  Created by Elver Mayta Hernández on 17/04/24.
//

import SwiftUI

struct CardListProdView: View {
    var product : ProductoListPresentable
    
    var body: some View {
        HStack{
            if let firstImageUrlString = product.imagen.first,
               let url = URL(string: firstImageUrlString) {
                ImagenProdView(url: url, size: CGSize(width: 150, height: 150))
                    .padding()
            }
            Spacer()
            VStack(alignment: .trailing){
                Text(product.name)
                    .padding()
                Text(String(product.precio))
                    .padding()
                    .font(.title3)
                    .fontWeight(.bold)
            }
        }
    }
}

//#Preview {
//    CardListView()
//}
