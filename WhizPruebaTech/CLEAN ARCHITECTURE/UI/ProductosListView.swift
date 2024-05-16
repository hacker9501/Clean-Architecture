//
//  ProductosListView.swift
//  PruebaTecnicaWhiz
//
//  Created by Elver Mayta Hernández on 17/04/24.
//

import SwiftUI

struct ProductosListView: View {
    
    @ObservedObject private var viewModel: ProductoListViewModel
    
    init(viewModel: ProductoListViewModel) {
        self.viewModel = viewModel
    }
    
    var body: some View {
        VStack{
            if viewModel.fechProducts {
                ProgressView().scaleEffect(2.0)
            }else{
                List(viewModel.product, id: \.id) { product in
                    NavigationLink(destination: DetailProdView(product: product)) {
                        CardListProdView(product: product)
                            .frame(maxWidth: .infinity)
                    }
                    .listRowSeparator(.hidden)
                    .listRowBackground(
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color.white)
                            .padding(EdgeInsets(top: 10, leading: 10, bottom: 2, trailing: 10)
                                    )
                            .shadow(color: Color.black.opacity(0.1), radius: 2, x: 3, y: 3)
                    )
                }
                .listStyle(PlainListStyle())
                .background(Color.clear)
            }
        }.background(Color.clear)
        .navigationTitle("Productos")
        .onAppear{
            Task{
                DispatchQueue.main.async{
                    viewModel.onAppear()
                }
            }
            
        }
        
    }
}

//#Preview {
//    ProductosListView()
//}
